       identification division.
       program-id.  DS-PP.
       author.  Bill Waller
      * billxwaller@gmail.com
      * Pre-processor
      * GNUCOBOL "length" needs a data-name for each field
      * This program inserts names for unnamed fields
       environment division.
       configuration section.
       repository.
           function upper-case intrinsic.

       input-output section.
       FILE-CONTROL.

           select Fdin-File
               assign to disk Fdin-File-Spec
               organization is line sequential
               file status is File-Status.

           select Fdout-File
               assign to disk Fdout-File-Spec
               organization is line sequential
               file status is File-Status.

       data division.
       FILE SECTION.

       fd  Fdin-File.
       01  Fdin-File-Record.
           02                    pic x(128).

       fd  Fdout-File.
       01  Fdout-File-Record.
           02                    pic x(128).

       working-storage section.

       01  Pgm-Id                pic x(15).
       01  Exit-Code             pic 9(4) binary.
       01  File-Status           pic x(2) value "00".
       01  redefines File-Status.
           02 Fs1                pic x(2).

       01  Fdin-File-Path        pic x(64) value "./".
       01  Fdin-File-Name        pic x(32) value "TMP.DS".
       01  Fdin-File-Spec        pic x(128) value spaces.

       01  Fdout-File-Path       pic x(64) value "./".
       01  Fdout-File-Name       pic x(32) value "DS.DS".
       01  Fdout-File-Spec       pic x(128) value spaces.

       01  File-Name             pic x(32) value spaces.
       01  File-Path             pic x(128) value spaces.
       01  File-Spec             pic x(128) value spaces.

       01  Fn                    pic x(5) value spaces.
       01  redefines Fn.
           02  Fn-name           pic x(2).
           02  Fn-num-F          pic 9(3).
       01  Fn-num                pic 9(3) binary value 0.

       01  field-rec.
           02  f-level           pic x(2) value spaces.
           02  f-name            pic x(30) value spaces.
           02  f-t3              pic x(15) value spaces.
           02  f-t4              pic x(15) value spaces.
           02  f-t5              pic x(15) value spaces.

       01  Fd-rec.
           02  Fd-Seq            pic x(6)   value spaces.
           02  Fd-Ind            pic x      value spaces.
           02  Fd-Area-A         pic x(65)  value spaces.
           02  redefines Fd-Area-A.
               03                pic x(4).
               03  Fd-Area-B     pic x(60).
       01  Fdin-rec redefines Fd-rec  pic x(72) value spaces.

       01  Cf-ptr                pic 9(4) binary.
       01  Fdin-ptr              pic 9(4) binary.
       01  Fdout-rec             pic x(72) value spaces.
       01  Fdout-ptr             pic 9(4) binary.
       01  level-ptr             pic 9(4) binary.
       01  name-ptr              pic 9(4) binary.
       01  pic-ptr               pic 9(4) binary.
       01  f-str                 pic x(30) value spaces.

       procedure division.

       Initialization.
           move function module-id to pgm-id.
           move 0 to Fn-num.

       Open-Fdin-File.
           move Fdin-File-Path to File-Path.
           move Fdin-File-Name to File-Name.
           perform Build-File-Spec.
           move File-Spec  to Fdin-File-Spec.
           open input Fdin-File.
           if Fs1 not = "00"
               display pgm-id " failed to open input: "
                   Fdin-File-Spec
               move 1 to Exit-Code
               go to End-Program.

       Open-Fdout-File.
           move Fdout-File-Path to File-Path.
           move Fdout-File-Name to File-Name.
           perform Build-File-Spec.
           move File-Spec  to Fdout-File-Spec.
           open output Fdout-File.
           if Fs1 not = "00"
               display pgm-id " failed to open output: "
                   Fdout-File-Spec
               move 1 to Exit-Code
               go to End-Program.

       Read-Fdin-File.
           read Fdin-File into Fdin-rec
               at end go to End-Program.
           if Fd-Ind = "*" then
               go to Read-Fdin-File.
           initialize field-rec.
           move 1 to Fdin-ptr.
           inspect Fdin-rec tallying Fdin-ptr for leading spaces.
           move Fdin-ptr to level-ptr.
           unstring Fdin-rec delimited by all spaces or "."
               into f-level pointer Fdin-ptr.
           if not f-level IS NUMERIC
               move upper-case(f-level) to f-str
               if f-str not = "DS"
                   go to Read-Fdin-File.
           move Fdin-ptr to name-ptr.
           unstring Fdin-rec delimited by all spaces or "."
               into f-name pointer Fdin-ptr.
           move upper-case(f-name) to f-str.
           if f-str not = "PIC"
               write Fdout-File-Record from Fdin-rec
               go to Read-Fdin-File.
      *    Found a "PIC" before field-name indicates
      *    no field-name. This inserts a name so that
      *    the GNUCOBOL runtime can determine the length.
           add 1 to Fn-num.
           move "fn" to Fn-name.
           move Fn-num to Fn-num-F.
           move Fn to f-name.
           move name-ptr to pic-ptr Fdin-ptr.
           unstring Fdin-rec delimited by all spaces or "."
               into f-t3 f-t4 f-t5 pointer Fdin-ptr.
           move spaces to Fdout-rec.
           move level-ptr to Fdout-ptr.
           string
               f-level delimited by spaces
               "  "    delimited by size
               f-name  delimited by spaces
               " "     delimited by size
                   into Fdout-rec pointer Fdout-ptr.
           if pic-ptr > Fdout-ptr
               move pic-ptr to Fdout-ptr.
           string
               f-t3  delimited by spaces
               " "   delimited by size
               f-t4  delimited by spaces
                   into Fdout-rec pointer Fdout-ptr.
           if f-t5 not = spaces
               string
                   " "   delimited by size
                   f-t5  delimited by spaces
                   into Fdout-rec pointer Fdout-ptr.
           string
               "."   delimited by size
               into Fdout-rec pointer Fdout-ptr.
           write Fdout-File-Record from Fdout-rec.
           go to Read-Fdin-File.

       End-Program.
           close Fdin-File.
           close Fdout-File.
           goback returning Exit-Code.

       Build-File-Spec.
           inspect File-Path replacing trailing "/" by spaces
               before initial spaces.
           move spaces to File-Spec.
           string
               File-Path delimited by spaces
               "/" delimited by size
               File-Name delimited by spaces
               into File-Spec.
