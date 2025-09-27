# MKRL-Rust

A modern Rust implementation of MKRL (Make Record Layout) - a COBOL record layout generator with an interactive dialog interface.

## About

This is a Rust port of the original COBOL-based MKRL system by Bill Waller. It generates record layouts containing the position, format, and length of each named data item from COBOL data structures.

## Features

- **Interactive Dialog Interface**: TUI-based interface for easy file selection and processing
- **Command Line Interface**: Traditional CLI for batch processing
- **COBOL Parsing**: Supports level numbers, PIC clauses, data types (COMP-3), and OCCURS clauses
- **Nested OCCURS**: Proper handling of nested OCCURS clauses with multiplication
- **Error Handling**: Detects and rejects unsupported features (variable length, redefines)
- **Accurate Calculations**: Correct COMP-3 length calculation and position tracking

## Installation

```bash
# Clone the repository
git clone https://github.com/BillWaller/MKRL.git
cd MKRL

# Build the Rust version
cargo build --release
```

## Usage

### Dialog Mode (Default)
```bash
cargo run
# or
cargo run -- --dialog
```

### Command Line Mode
```bash
cargo run -- path/to/your/file.FD
# or  
cargo run -- path/to/your/file.DS
```

### Options
```bash
cargo run -- --help
```

## Examples

The `MKRL-0.7.1/examples/` directory contains several example COBOL data structures:

- `SYSDATES.FD` - Simple date structure with COMP-3 fields (41 bytes)
- `DINC.FD` - Complex structure with nested OCCURS clauses (150 bytes)  
- `BD.FD` - Business data structure (182 bytes)
- `DARCM.FD` - Large customer master file (385 bytes)
- `DARSP.FD` - Structure with large OCCURS clause (2970 bytes)

## Output Format

The generated `.RL` files contain:
```
Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Record-Name                                                    41     1      
field-name-1                  9(8)           COMP-3                   1     5
field-name-2                  x(20)                                   6    20
...
                                                                        -----
                                        Total                             41
```

## Supported Features

- ✅ Level numbers (01-99)
- ✅ Field names with hyphens
- ✅ PIC clauses (9, X, Z patterns)
- ✅ Data types (COMP-3, COMP, etc.)
- ✅ OCCURS clauses (single and nested)
- ✅ Hierarchical field structures
- ❌ Variable length records
- ❌ REDEFINES clauses

## Technical Details

The Rust implementation consists of three main modules:

1. **cobol_parser.rs**: Parses COBOL data structures into an AST
2. **record_layout.rs**: Generates formatted record layouts from the AST
3. **dialog.rs**: Provides the interactive TUI interface

## License

GPL-3.0 (same as original)

## Author

Original COBOL version: Bill Waller (billxwaller@gmail.com)
Rust implementation: Ported with modern dialog interface