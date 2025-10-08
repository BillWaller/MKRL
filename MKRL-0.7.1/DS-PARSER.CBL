       identification division.
       program-id.  DS-PARSER.
       author.  Bill Waller
      * billxwaller@gmail.com

       environment division.
       configuration section.

       repository.
           function upper-case intrinsic.

       input-output section.
       FILE-CONTROL.

           select Fd-File
               assign to disk Fd-File-Spec
               organization is line sequential
               file status is File-Status.

           select Code-File
               assign to disk Code-File-Spec
               organization is line sequential
               file status is File-Status.

       data division.
       FILE SECTION.

       fd  Fd-File.
       01  Fd-File-Record.
           02                    pic x(128).

       fd  Code-File.
       01  Code-File-Record.
           02                    pic x(128).

       working-storage section.

       01  Exit-Code             pic 99 binary value 0.
       01  File-Status           pic x(2)   value "00".
       01  redefines File-Status.
           02 Fs1                pic x(2).

       01  Pgm-Id                pic x(15).
       01  Fd-rec                pic x(72)  value spaces.
       01  Fd-ptr                pic 9(4) binary.

       01  Cf-rec.
           02  Cf-Seq            pic x(6)   value spaces.
           02  Cf-Ind            pic x      value spaces.
           02  Cf-Area-A         pic x(64)  value spaces.
           02  redefines Cf-Area-A.
               03                pic x(4).
               03  Cf-Area-B     pic x(60).

       01  Cf-ptr                pic 9(4) binary.

       01  field-rec.
           02  f-level           pic x(2)   value spaces.
           02  f-name            pic x(30)  value spaces.
           02  f-t3              pic x(15)  value spaces.
           02  f-t4              pic x(15)  value spaces.
           02  f-t5              pic x(15)  value spaces.

       01  f-str                 pic x(15)  value spaces.
       01  f-ptr                 pic 9(4)   value 0.
       01  f-elements            pic 9(4)   value 0.
       01  f-num                 pic 9(4)   value 0.
       01  f-num-z               pic zzz9.
       01  f-occurs-stm          pic 9      value 0.

       01  dimension-table occurs 20 times.
           02  dt-level          pic x(2)   value "00".
           02  dt-occurs         pic 9(4)   value 0.
           02  dt-elements       pic 9(4)   value 0.
       01  dt-index              pic 9(4)   value 0.

       01  Fd-File-Path          pic x(64)  value "./".
       01  Fd-File-Name          pic x(32)  value "DS.DS".
       01  Fd-File-Spec          pic x(128) value spaces.

       01  Code-File-Path        pic x(64)  value "./".
       01  Code-File-Name        pic x(32)  value "DS-ANALYZER.CBL".
       01  Code-File-Spec        pic x(64)  value spaces.

       01  File-Name             pic x(32)  value spaces.
       01  File-Path             pic x(128) value spaces.
       01  File-Spec             pic x(128) value spaces.

       procedure division.

       Initialization.
           move function module-id to pgm-id.

       Open-Fd-File.
           move Fd-File-Path to File-Path.
           move Fd-File-Name to File-Name.
           perform Build-File-Spec.
           move File-Spec  to Fd-File-Spec.
           open input Fd-File.
           if Fs1 not = "00"
               display pgm-id " failed to open input: "
                   Fd-File-Spec
               move 1 to Exit-Code
               go to End-Program.

       Open-Code-File.
           move Code-File-Path to File-Path.
           move Code-File-Name to File-Name.
           perform Build-File-Spec.
           move File-Spec  to Code-File-Spec.
           open output Code-File.
           if Fs1 not = "00"
               display pgm-id " failed to open output: "
                   Code-File-Spec
               move 1 to Exit-Code
               go to End-Program.
           move 0 to dt-index.

       Read-Fd-File.
           read Fd-File into Fd-rec
               at end go to End-Program.
           initialize field-rec.
      *
           move 1 to Fd-ptr.
           inspect Fd-rec tallying Fd-ptr for leading spaces.
           unstring Fd-rec
               delimited by all spaces or "."
               into f-level pointer Fd-ptr.
           if not f-level IS NUMERIC then
               go to Read-Fd-File.
      *
           move spaces to Cf-rec.
           move 1 to Cf-ptr.
           move "*" to Cf-Ind.
           string
               " level " delimited by size
               f-level   delimited by size
                   into Cf-Area-A pointer Cf-ptr.
           write Code-File-Record from Cf-Rec.

      *    Get the tokens
           unstring Fd-rec delimited by all spaces or "."
               into f-name f-t3 f-t4 f-t5 with pointer Fd-ptr.
           move 0 to f-occurs-stm.
           move upper-case(f-t3) to f-str.
           if f-str not = "OCCURS"
               go to Field-Name.

      *    OCCURS
           move function numval(f-t4) to f-num.
           add 1 to dt-index.
           move f-level      to   dt-level(dt-index).
           if f-elements = 0
               move f-num to f-elements dt-elements(dt-index)
           else
               multiply f-num by f-elements
               move f-elements to dt-elements(dt-index).
           move f-num to f-num-z.
           move 1 to f-ptr.
           inspect  f-num-z tallying f-ptr for leading spaces.
           unstring f-num-z
               delimited by all spaces
               into f-str pointer f-ptr.
           string
               "OCCURS(" delimited by size
               f-str     delimited by all spaces
               ")"       delimited by size
               into f-t4.
           move 0 to f-num.
           move 1 to f-occurs-stm.
           move upper-case(f-t5) to f-str.
           if f-str = "TIMES"
               move spaces to f-t5.

       Field-Name.
           move spaces to Cf-Rec.
           move 1 to Cf-Ptr.
           string
               "move """       delimited by size
               f-name          delimited by all spaces
               """ to f-name." delimited by size
               into Cf-Area-B pointer Cf-ptr.
           write Code-File-Record from Cf-Rec.

      *    token 4 - probably Format
           if f-t4 not = spaces 
               move spaces to Cf-Rec
               move 1 to Cf-Ptr
               string
                   "move """     delimited by size
                   f-t4          delimited by all spaces
                   """ to f-t4." delimited by size
                   into Cf-Area-B pointer Cf-Ptr
               write Code-File-Record from Cf-Rec
           else
               move "move spaces to f-t4." to Cf-Area-B
               write Code-File-Record from Cf-Rec.

      *    token 5 - probably Type
           if f-t5 not = spaces
               move spaces to Cf-Rec
               move 1 to Cf-Ptr
               string
                   "move """     delimited by size
                   f-t5          delimited by all spaces
                   """ to f-t5." delimited by size
                   into Cf-Area-B pointer Cf-Ptr
               write Code-File-Record from Cf-Rec
           else
               move "move spaces to f-t5." to Cf-Area-B
               write Code-File-Record from Cf-Rec.

           move spaces to Cf-Rec.
           if f-occurs-stm = 1
      *        OCCURS statement
               move "move 0 to f-flen flen f-clen." to Cf-Area-B
               write Code-File-Record from Cf-Rec
               go to Wrap.

      *    Get length
           move 1 to Cf-ptr.
           string
               "move length " delimited by size
               f-name         delimited by all spaces
               " to len."     delimited by size
               into Cf-Area-B pointer Cf-ptr.
           write Code-File-Record from Cf-Rec.

           if f-elements = 0
               go to Not-Dimensional-Data.
      *    Collapse the dimensional table (to the current level)
           perform until dt-level(dt-index) not > f-level
                  or dt-index = 1
               subtract 1 from dt-index
               move dt-elements(dt-index) to f-elements
           end-perform.
           if dt-level(dt-index) = f-level
               subtract 1 from dt-index
               if dt-index = 0
                   move 0 to f-elements
                   go to Not-Dimensional-Data
               else
                   move dt-elements(dt-index) to f-elements.

       Dimensional-Data.
           move spaces to Cf-Rec.
           move 1 to Cf-Ptr.
           string
               "multiply " delimited by size
               f-elements delimited by size
               " by len."  delimited by size
               into Cf-Area-B pointer cf-Ptr.
           write Code-File-Record from Cf-Rec.
           move "move len to f-flen flen." to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move "move 0 to f-clen."        to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move "move 0 to f-elements."    to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           go to Wrap.

       Not-Dimensional-Data.
           if f-t4 = spaces
               go to Not-Data.
           move "move len to f-flen flen." to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move "move 0 to f-clen."        to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           go to Wrap.

       Not-Data.
           move "move len to f-clen."    to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move "move 0 to f-flen flen." to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
      *
       Wrap.
           move "move rl-pos to f-pos." to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move "perform Write-Rl."     to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move "add flen to rl-pos."   to Cf-Area-B.
           write Code-File-Record from Cf-Rec.
           move spaces to Cf-Rec.
           write Code-File-Record from Cf-Rec.
           go to Read-Fd-File.

       End-Program.
           close Fd-File.
           close Code-File.
           goback returning Exit-Code.

       Build-File-Spec.
           inspect
               File-Path replacing trailing "/" by spaces
               before initial spaces.
           move spaces to File-Spec.
           string
               File-Path delimited by spaces
               "/" delimited by size
               File-Name delimited by spaces
               into File-Spec.
