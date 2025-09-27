use crate::cobol_parser::{CobolField, CobolStructure};
use anyhow::Result;

pub fn generate_layout(structure: &CobolStructure) -> Result<String> {
    let mut output = String::new();
    
    // Header
    output.push_str("Data Name                     Format         Type           N-Len  Pos  F-Len\n");
    output.push_str("----------------------------- -------------- -------------- ----- ----- -----\n");
    
    let mut position = 1usize;
    let mut total_length = 0usize;
    
    for field in &structure.root_fields {
        // First pass to calculate total
        let start_pos = position;
        process_field(field, &mut String::new(), &mut position, &mut total_length, 0)?;
        let calculated_total = position - start_pos;
        
        // Reset position and generate actual output
        position = start_pos;
        
        // Generate output with correct N-Len for level 01
        if field.level == 1 {
            // Add the level 01 field with N-Len
            let field_name = truncate_string(&field.name, 29);
            output.push_str(&format!(
                "{:<29} {:<14} {:<14} {:5} {:5}      \n",
                field_name, "", "", calculated_total, position
            ));
        }
        
        // Process children
        for child in &field.children {
            process_field(child, &mut output, &mut position, &mut total_length, 1)?;
        }
        
        total_length = calculated_total;
    }
    
    // Footer with total
    output.push_str("                                                                        -----\n");
    output.push_str(&format!("                                        Total            {:6}\n", total_length));
    
    Ok(output)
}

fn process_field(
    field: &CobolField,
    output: &mut String,
    position: &mut usize,
    total_length: &mut usize,
    _depth: usize,
) -> Result<()> {
    process_field_with_multiplier(field, output, position, total_length, _depth, 1)
}

fn process_field_with_multiplier(
    field: &CobolField,
    output: &mut String,
    position: &mut usize,
    total_length: &mut usize,
    _depth: usize,
    inherited_multiplier: usize,
) -> Result<()> {
    let field_name = truncate_string(&field.name, 29);
    let format = get_format_string(field);
    let data_type = field.data_type.as_deref().unwrap_or("").to_string();
    
    let (field_length, displayed_length) = calculate_field_length(field)?;
    
    // Calculate effective multiplier from parent OCCURS
    let effective_multiplier = if let Some(occurs) = field.occurs {
        inherited_multiplier * (occurs as usize)
    } else {
        inherited_multiplier
    };
    
    // For group items (fields with children), show total length in N-Len column
    let current_pos = *position;
    
    // Format the line
    let pos_str = if field.children.is_empty() {
        format!("{:5}", current_pos)
    } else if field.level == 1 {
        format!("{:5}", current_pos) 
    } else {
        // For group fields with OCCURS, show the starting position
        format!("{:5}", current_pos)
    };
    
    let length_str = if field.children.is_empty() && displayed_length > 0 {
        let effective_length = displayed_length * effective_multiplier;
        format!("{:5}", effective_length)
    } else {
        "     ".to_string()
    };
    
    let total_len_str = if field.level == 1 {
        "     ".to_string() // Will be filled in at the end based on total position advancement
    } else {
        "     ".to_string()
    };
    
    output.push_str(&format!(
        "{:<29} {:<14} {:<14} {} {} {}\n",
        field_name,
        truncate_string(&format, 14),
        truncate_string(&data_type, 14),
        total_len_str,
        pos_str,
        length_str
    ));
    
    if field.children.is_empty() {
        // Leaf field - advance position 
        *position += displayed_length * effective_multiplier;
        if field.level == 1 {
            *total_length = field_length * effective_multiplier;
        }
    } else {
        // Group field - process children
        let start_pos = *position;
        for child in &field.children {
            process_field_with_multiplier(child, output, position, total_length, _depth + 1, effective_multiplier)?;
        }
        
        // For level 01 groups, set total length based on position advancement
        if field.level == 1 {
            *total_length = *position - start_pos;
        }
    }
    
    Ok(())
}

fn get_format_string(field: &CobolField) -> String {
    if let Some(occurs) = field.occurs {
        format!("OCCURS({})", occurs)
    } else if let Some(picture) = &field.picture {
        picture.clone()
    } else {
        String::new()
    }
}

fn calculate_field_length(field: &CobolField) -> Result<(usize, usize)> {
    if !field.children.is_empty() {
        // Group field - calculate based on children (without OCCURS multiplication)
        let mut total = 0;
        
        for child in &field.children {
            let (_, child_displayed) = calculate_field_length(child)?;
            total += child_displayed;
        }
        
        Ok((total, total))
    } else if let Some(picture) = &field.picture {
        // Leaf field with picture clause (without OCCURS multiplication)
        let actual_length = if let Some(comp_type) = &field.data_type {
            calculate_comp_length(picture, comp_type)?
        } else {
            calculate_picture_length(picture)?
        };
        
        Ok((actual_length, actual_length))
    } else {
        // Group field without picture (like OCCURS without PIC)
        Ok((0, 0))
    }
}

fn calculate_picture_length(picture: &str) -> Result<usize> {
    // Handle common COBOL picture patterns
    if picture == "9" {
        return Ok(1);
    }
    
    // Handle s9(n)v9(n) format first (signed decimal with implied decimal point)
    if let Some(captures) = regex::Regex::new(r"s?9\((\d+)\)(?:v9\((\d+)\))?")?.captures(picture) {
        let int_digits: usize = captures.get(1).unwrap().as_str().parse()?;
        let dec_digits: usize = captures.get(2).map(|m| m.as_str().parse().unwrap_or(0)).unwrap_or(0);
        return Ok(int_digits + dec_digits);
    }
    
    // Handle 9(n) format
    if let Some(captures) = regex::Regex::new(r"^9\((\d+)\)$")?.captures(picture) {
        let count: usize = captures.get(1).unwrap().as_str().parse()?;
        return Ok(count);
    }
    
    // Handle x(n) format (character)
    if let Some(captures) = regex::Regex::new(r"x\((\d+)\)")?.captures(picture) {
        let count: usize = captures.get(1).unwrap().as_str().parse()?;
        return Ok(count);
    }
    
    // Handle zzzzz9 format (zero suppression)
    if picture == "zzzzz9" {
        return Ok(6);
    }
    
    // Default case - count characters
    Ok(picture.len())
}

fn calculate_comp_length(picture: &str, comp_type: &str) -> Result<usize> {
    match comp_type {
        "COMP-3" => {
            // COMP-3 (packed decimal): (digits + 1) / 2 rounded up
            let digits = if let Some(captures) = regex::Regex::new(r"s?9\((\d+)\)(?:v9\((\d+)\))?")?.captures(picture) {
                let int_digits: usize = captures.get(1).unwrap().as_str().parse()?;
                let dec_digits: usize = captures.get(2).map(|m| m.as_str().parse().unwrap_or(0)).unwrap_or(0);
                int_digits + dec_digits
            } else if picture == "9" {
                1
            } else {
                calculate_picture_length(picture)?
            };
            Ok((digits + 1 + 1) / 2) // Add 1 for rounding up
        }
        "COMP" | "COMP-1" | "COMP-2" => {
            // Binary formats - typically 4 bytes for most integers
            Ok(4)
        }
        _ => {
            // Unknown COMP type, use picture length
            calculate_picture_length(picture)
        }
    }
}

fn truncate_string(s: &str, max_len: usize) -> String {
    if s.len() <= max_len {
        s.to_string()
    } else {
        s[..max_len].to_string()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::cobol_parser::CobolField;

    #[test]
    fn test_calculate_picture_length() {
        assert_eq!(calculate_picture_length("9(8)").unwrap(), 8);
        assert_eq!(calculate_picture_length("x(20)").unwrap(), 20);
        assert_eq!(calculate_picture_length("zzzzz9").unwrap(), 6);
        assert_eq!(calculate_picture_length("s9(9)v9(2)").unwrap(), 11);
    }

    #[test]  
    fn test_calculate_comp_length() {
        assert_eq!(calculate_comp_length("9(8)", "COMP-3").unwrap(), 5);
        assert_eq!(calculate_comp_length("s9(9)v9(2)", "COMP-3").unwrap(), 6);
        assert_eq!(calculate_comp_length("9(4)", "COMP").unwrap(), 4);
    }

    #[test]
    fn test_calculate_field_length() {
        let field = CobolField {
            level: 2,
            name: "test-field".to_string(),
            picture: Some("9(8)".to_string()),
            data_type: Some("COMP-3".to_string()),
            occurs: None,
            children: Vec::new(),
            line_number: 1,
        };
        
        let (total, displayed) = calculate_field_length(&field).unwrap();
        assert_eq!(total, 5); // COMP-3 of 9(8) is 5 bytes
        assert_eq!(displayed, 5);
    }
}