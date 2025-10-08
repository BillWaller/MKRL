use anyhow::Result;
use cursive::views::{Button, Dialog, EditView, LinearLayout, Panel, SelectView, TextView};
use cursive::view::{Nameable, Resizable};
use cursive::{Cursive, CursiveExt};
use std::path::Path;

use crate::{cobol_parser, record_layout};

pub fn run_dialog() -> Result<()> {
    let mut siv = Cursive::default();

    // Create the main dialog
    let main_dialog = create_main_dialog();
    siv.add_layer(main_dialog);

    // Set up global callbacks
    siv.add_global_callback('q', |s| s.quit());
    siv.add_global_callback(cursive::event::Key::Esc, |s| s.quit());

    siv.run();
    Ok(())
}

fn create_main_dialog() -> Dialog {
    Dialog::around(
        LinearLayout::vertical()
            .child(TextView::new(
                "MKRL - COBOL Record Layout Generator\n\
                 Select an option below:"
            ))
            .child(Button::new("Process File", show_file_dialog))
            .child(Button::new("View Examples", show_examples))
            .child(Button::new("About", show_about))
            .child(Button::new("Quit", |s| s.quit()))
    )
    .title("MKRL - Main Menu")
    .button("Quit", |s| s.quit())
}

fn show_file_dialog(s: &mut Cursive) {
    let file_dialog = Dialog::around(
        LinearLayout::vertical()
            .child(TextView::new("Enter the path to your COBOL data structure file:"))
            .child(EditView::new().with_name("file_path").min_width(50))
            .child(TextView::new("\nSupported formats: .DS, .FD, .CBL"))
    )
    .title("Select Input File")
    .button("Process", |s| {
        let file_path = s
            .call_on_name("file_path", |view: &mut EditView| view.get_content())
            .unwrap();
        
        if file_path.is_empty() {
            show_error(s, "Please enter a file path");
            return;
        }
        
        process_file_dialog(s, &file_path);
    })
    .button("Browse Examples", |s| {
        s.pop_layer();
        show_examples(s);
    })
    .button("Cancel", |s| { s.pop_layer(); });

    s.add_layer(file_dialog);
}

fn process_file_dialog(s: &mut Cursive, file_path: &str) {
    let path = Path::new(file_path);
    
    if !path.exists() {
        show_error(s, &format!("File not found: {}", file_path));
        return;
    }

    // Read and process the file
    match std::fs::read_to_string(path) {
        Ok(content) => {
            match cobol_parser::parse_cobol_structure(&content) {
                Ok(structure) => {
                    match record_layout::generate_layout(&structure) {
                        Ok(layout) => {
                            let output_path = path.with_extension("RL");
                            match std::fs::write(&output_path, &layout) {
                                Ok(_) => {
                                    show_success(s, &format!(
                                        "Record layout generated successfully!\n\
                                        Output file: {}\n\n{}",
                                        output_path.display(),
                                        layout
                                    ));
                                }
                                Err(e) => show_error(s, &format!("Failed to write output file: {}", e)),
                            }
                        }
                        Err(e) => show_error(s, &format!("Failed to generate layout: {}", e)),
                    }
                }
                Err(e) => show_error(s, &format!("Failed to parse COBOL structure: {}", e)),
            }
        }
        Err(e) => show_error(s, &format!("Failed to read file: {}", e)),
    }
}

fn show_examples(s: &mut Cursive) {
    let mut list = SelectView::new()
        .h_align(cursive::align::HAlign::Left)
        .autojump();

    // Add example files from the MKRL-0.7.1/examples directory
    let example_files = vec![
        ("SYSDATES.FD", "Simple date structure with COMP-3 fields"),
        ("DINC.FD", "Complex structure with nested OCCURS clauses"),
        ("SALES.FD", "Sales data with various field types"),
        ("BD.FD", "Business date structure"),
        ("TINMAST.FD", "Master file with multiple record types"),
    ];

    for (file, description) in example_files {
        list.add_item(format!("{:<15} - {}", file, description), file);
    }

    let examples_dialog = Dialog::around(
        LinearLayout::vertical()
            .child(TextView::new("Select an example to process:"))
            .child(Panel::new(list.with_name("examples_list")))
    )
    .title("Example Files")
    .button("Process", |s| {
        let selection = s
            .call_on_name("examples_list", |view: &mut SelectView<&str>| {
                view.selection().map(|s| s.as_ref().to_string())
            })
            .unwrap();

        if let Some(file_name) = selection {
            let example_path = format!("MKRL-0.7.1/examples/{}", file_name);
            s.pop_layer(); // Remove examples dialog
            process_file_dialog(s, &example_path);
        }
    })
    .button("View", |s| {
        let selection = s
            .call_on_name("examples_list", |view: &mut SelectView<&str>| {
                view.selection().map(|s| s.as_ref().to_string())
            })
            .unwrap();

        if let Some(file_name) = selection {
            view_example_file(s, &file_name);
        }
    })
    .button("Back", |s| { s.pop_layer(); });

    s.add_layer(examples_dialog);
}

fn view_example_file(s: &mut Cursive, file_name: &str) {
    let example_path = format!("MKRL-0.7.1/examples/{}", file_name);
    let path = Path::new(&example_path);

    if !path.exists() {
        show_error(s, &format!("Example file not found: {}", example_path));
        return;
    }

    match std::fs::read_to_string(path) {
        Ok(content) => {
            let view_dialog = Dialog::around(
                Panel::new(TextView::new(content))
                    .title(&format!("Content of {}", file_name))
                    .min_width(80)
                    .min_height(20)
            )
            .title("View Example")
            .button("Close", |s| { s.pop_layer(); });

            s.add_layer(view_dialog);
        }
        Err(e) => show_error(s, &format!("Failed to read example file: {}", e)),
    }
}

fn show_about(s: &mut Cursive) {
    let about_dialog = Dialog::around(
        TextView::new(
            "MKRL - COBOL Record Layout Generator\n\
            Version 0.1.0 (Rust Implementation)\n\n\
            Original Author: Bill Waller\n\
            Email: billxwaller@gmail.com\n\n\
            This is a Rust implementation of the original COBOL-based MKRL system.\n\
            It generates record layouts showing position, format, and length\n\
            of each field in COBOL data structures.\n\n\
            Features:\n\
            • Interactive dialog interface\n\
            • CLI mode support\n\
            • Support for COMP-3 and other data types\n\
            • OCCURS clause handling\n\
            • Error checking for unsupported features\n\n\
            License: GPL-3.0\n\n\
            Press 'q' or ESC to quit at any time."
        )
    )
    .title("About MKRL")
    .button("Close", |s| { s.pop_layer(); });

    s.add_layer(about_dialog);
}

fn show_error(s: &mut Cursive, message: &str) {
    let error_dialog = Dialog::around(TextView::new(message))
        .title("Error")
        .button("OK", |s| { s.pop_layer(); });
    s.add_layer(error_dialog);
}

fn show_success(s: &mut Cursive, message: &str) {
    let success_dialog = Dialog::around(
        Panel::new(TextView::new(message))
            .min_width(80)
            .min_height(10)
    )
    .title("Success")
    .button("OK", |s| { s.pop_layer(); });
    s.add_layer(success_dialog);
}