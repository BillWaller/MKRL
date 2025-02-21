# MKRL
GNUCOBOL Record Layouts from File Descriptors

Developed and tested with GNUCOBOL 3.3.

usage: mkrl File-Specification (full path and filename)

mkrl

Developed and tested with GNUCOBOL 3.3.

usage: mkrl File-Specification (full path and filename)

This program creates record layouts from COBOL data structures,
which may be File Descriptors. Currently, it only works with
flat data structures, although multi-dimensional tables may
be added in the future.

Assume you want a record layout from an FD stored in
../CPY/SYSDATES.FD. Change to the MKRL directory and type:

    mkrl.sh ../CPY/SYSDATES.FD

When the script finishes, hopefully, you will find the record
layout in SYSDATES.RL.

1. The specified File Descriptor is copied to TMP.FD in the current
   directory, replacing the FD Filename with "TMP-File".

2. FD-PARSER parses TMP.FD, formatting each line as COBOL code
   to comprise FD-ANALYZER.CBL, which is incorporated into RL.CBL.
   RL.CBL is then compiled so that GNUCOBOL "length" can be used
   to determine the compiled length of each field.

3. RL creates the record layout in TMP.RL, and the script, mkrl.sh.
   moves it to SYSDATES.RL in the MKRL directory.

-------------------------------------------------------------------
A COBOL file descriptor is no substitute for a proper record
layout. Many people, who have never programmed in COBOL, are
unfamiliar with data types, such as packed-decimal. A proper record
layout gives the starting position of each field and field and
record length.

The MicroFocus compiler has an option to print a listing which
produces everything you need to easily format a proper record
layout, including the length of each data item.

Within the execution unit, GNUCOBOL supports "length Data-Name"
which gives the length of data items. This program parses file
"README" 53L, 1908B                                           1,1           Top
