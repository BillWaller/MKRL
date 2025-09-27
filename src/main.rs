mod cobol_parser;
mod record_layout;
mod dialog;

use anyhow::Result;
use clap::{Arg, Command};
use std::path::Path;

fn main() -> Result<()> {
    let matches = Command::new("mkrl-rust")
        .version("0.1.0")
        .author("Bill Waller <billxwaller@gmail.com>")
        .about("COBOL Record Layout Generator with Dialog Interface")
        .arg(
            Arg::new("input")
                .help("Input COBOL data structure file (.DS or .FD)")
                .value_name("FILE")
                .index(1),
        )
        .arg(
            Arg::new("dialog")
                .short('d')
                .long("dialog")
                .help("Launch interactive dialog interface")
                .action(clap::ArgAction::SetTrue),
        )
        .arg(
            Arg::new("no-remove")
                .long("no-remove")
                .help("Don't remove temporary files")
                .action(clap::ArgAction::SetTrue),
        )
        .get_matches();

    if matches.get_flag("dialog") || matches.get_one::<String>("input").is_none() {
        // Launch dialog interface
        dialog::run_dialog()?;
    } else {
        // CLI mode
        let input_file = matches.get_one::<String>("input").unwrap();
        let keep_temp = matches.get_flag("no-remove");
        
        println!("Processing COBOL data structure: {}", input_file);
        process_file(input_file, keep_temp)?;
    }

    Ok(())
}

fn process_file(input_path: &str, _keep_temp: bool) -> Result<()> {
    let path = Path::new(input_path);
    
    if !path.exists() {
        anyhow::bail!("File not found: {}", input_path);
    }

    // Read and parse the COBOL data structure
    let content = std::fs::read_to_string(path)?;
    let data_structure = cobol_parser::parse_cobol_structure(&content)?;
    
    // Generate the record layout
    let layout = record_layout::generate_layout(&data_structure)?;
    
    // Determine output file name
    let output_path = path.with_extension("RL");
    
    // Write the record layout
    std::fs::write(&output_path, layout)?;
    
    println!("Record layout written to: {}", output_path.display());
    
    Ok(())
}
