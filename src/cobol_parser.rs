use anyhow::{Result, bail};
use regex::Regex;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CobolField {
    pub level: u32,
    pub name: String,
    pub picture: Option<String>,
    pub data_type: Option<String>,
    pub occurs: Option<u32>,
    pub children: Vec<CobolField>,
    pub line_number: usize,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CobolStructure {
    pub name: String,
    pub root_fields: Vec<CobolField>,
}

pub fn parse_cobol_structure(content: &str) -> Result<CobolStructure> {
    let lines: Vec<&str> = content.lines().collect();
    let mut structure = CobolStructure {
        name: String::new(),
        root_fields: Vec::new(),
    };

    // Check for unsupported features
    check_unsupported_features(content)?;

    let mut field_stack: Vec<CobolField> = Vec::new();
    let mut current_level = 0u32;

    for (line_num, line) in lines.iter().enumerate() {
        let line = line.trim_start();
        
        // Skip comments, blank lines, and FD declarations
        if line.is_empty() || line.starts_with('*') || line.trim_start_matches(char::is_whitespace).starts_with("fd ") {
            continue;
        }

        // Try to parse as a COBOL field definition
        if let Some(field) = parse_cobol_line(line, line_num + 1)? {
            if structure.name.is_empty() && field.level == 1 {
                structure.name = field.name.clone();
            }

            // Handle field hierarchy
            while current_level >= field.level && !field_stack.is_empty() {
                let completed_field = field_stack.pop().unwrap();
                if field_stack.is_empty() {
                    structure.root_fields.push(completed_field);
                } else {
                    let parent = field_stack.last_mut().unwrap();
                    parent.children.push(completed_field);
                }
                current_level = field_stack.last().map(|f| f.level).unwrap_or(0);
            }

            current_level = field.level;
            field_stack.push(field);
        }
    }

    // Close remaining fields
    while let Some(field) = field_stack.pop() {
        if field_stack.is_empty() {
            structure.root_fields.push(field);
        } else {
            let parent = field_stack.last_mut().unwrap();
            parent.children.push(field);
        }
    }

    Ok(structure)
}

fn check_unsupported_features(content: &str) -> Result<()> {
    let lower_content = content.to_lowercase();
    
    if lower_content.contains("varying in size") {
        bail!("ERROR: variable length files not implemented");
    }
    
    if Regex::new(r"occurs\s+\d+\s+to")?.is_match(&lower_content) {
        bail!("ERROR: variable length files not implemented");
    }
    
    if lower_content.contains("redefines") {
        bail!("ERROR: redefines not implemented");
    }
    
    Ok(())
}

fn parse_cobol_line(line: &str, line_number: usize) -> Result<Option<CobolField>> {
    // Regex to match COBOL field definitions - case insensitive
    // Pattern: level-number field-name [PIC picture-string] [COMP-3] [OCCURS n TIMES] [.]
    let field_regex = Regex::new(
        r"(?i)^\s*(\d{2})\s+([A-Za-z][\w-]*)\s*(?:pic\s+([^\s.]+))?\s*(?:(comp(?:-?[0-9]+)?))?\s*(?:occurs\s+(\d+)\s+times?)?\s*\.?"
    )?;
    
    if let Some(captures) = field_regex.captures(line) {
        let level: u32 = captures.get(1).unwrap().as_str().parse()?;
        let name = captures.get(2).unwrap().as_str().to_string();
        let picture = captures.get(3).map(|m| m.as_str().to_string());
        let data_type = captures.get(4).and_then(|m| {
            let s = m.as_str();
            if s.is_empty() { None } else { Some(s.to_uppercase()) }
        });
        let occurs = captures.get(5).and_then(|m| m.as_str().parse().ok());

        Ok(Some(CobolField {
            level,
            name,
            picture,
            data_type,
            occurs,
            children: Vec::new(),
            line_number,
        }))
    } else {
        Ok(None)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_simple_field() {
        let line = "           02  sd-Cstart-Yyyymmdd   pic 9(8) COMP-3.";
        let field = parse_cobol_line(line, 1).unwrap().unwrap();
        
        assert_eq!(field.level, 2);
        assert_eq!(field.name, "sd-Cstart-Yyyymmdd");
        assert_eq!(field.picture, Some("9(8)".to_string()));
        assert_eq!(field.data_type, Some("COMP-3".to_string()));
        assert_eq!(field.occurs, None);
    }

    #[test]
    fn test_parse_occurs_field() {
        let line = "           02  Dinc-Bsta occurs 2 times.";
        let field = parse_cobol_line(line, 1).unwrap().unwrap();
        
        assert_eq!(field.level, 2);
        assert_eq!(field.name, "Dinc-Bsta");
        assert_eq!(field.occurs, Some(2));
    }

    #[test]
    fn test_unsupported_features() {
        let content = "01 test redefines something.";
        assert!(check_unsupported_features(content).is_err());
        
        let content2 = "01 test varying in size.";
        assert!(check_unsupported_features(content2).is_err());
    }
}