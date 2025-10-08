# MKRL
#### by Bill Waller
**MKRL** creates record layouts containing the position, format, and length of each named data item from COBOL data structures, such as File Descriptors.

Developed and tested with **GNUCOBOL 3.3**.

usage: **mkrl.sh** [-nr] File-Specification (full path and filename)

## Example:

Assume you want a record layout from a data structure. In this example, the first line of our data structure is a level 01 group name, **Sysdates-File-Record**.

>       01  Sysdates-File-Record.

* Save the data structure in a file, with an extension, **.DS**, in the **MKRL** directory. In this case, we will name our input file: **SYSDATES.DS**. Only lines beginning with leading spaces followed by a level-number will be processed. 

* Change to the MKRL directory and type:

     > **./mkrl.sh ../CPY/SYSDATES.DS**

* View the record layout in **SYSDATES.RL**

---

## How it works

1. The specified data structure, **SYSDATES.DS** is copied to **TMP.DS** in the **MKRL** directory.

2. **DS-PP** preprocesses **TMP.DS**, writing its output in **DS.DS**.

3. **DS-PARSER** parses **DS.DS**, transforming each data item into COBOL code snippets, which it writes to **DS-ANALYZER.CBL**.

4. **DS-ANALYZER.CBL** is incorporated via a copy directive into **RL.CBL** during compliation.

5. An output file name, **SYSDATES.RL**, is derived from the input file name by repllacing the **.DS** extension with **.RL**. **RL** uses the **GNUCobol runtime library** to analyze the data structure, producing the record layout, which it writes to **SYSDATES.RL**. 

eMail [Bill Waller](billxwaller@gmail.com)
