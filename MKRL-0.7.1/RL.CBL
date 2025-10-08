       identification division.
       program-id.  RL.
       author.  Bill Waller
      * billxwaller@gmail.com
       environment division.
       input-output section.
       FILE-CONTROL.

           select Fd-File
               assign to disk Fd-File-Spec
               organization is line sequential
               file status is File-Status.

           select Rl-File
               assign to disk Rl-File-Spec
               organization is line sequential
               file status is File-Status.

       data division.
       FILE SECTION.

       fd  Fd-File.
       01  Fd-File-Record.
           02             pic x(128).

       fd  Rl-File.
       01  Rl-File-Record.
           02             pic x(81).

       working-storage section.

       copy "DS.DS".

       01  Pgm-Id         pic x(15).
       01  Exit-Code      pic 99 binary value 0.
       01  File-Status    pic x(2) value "00".
       01  redefines File-Status.
           02 Fs1         pic x(2).

       01  Rl-Path        pic x(64) value "./".
       01  Rl-File-Name   pic x(8) value "DS.RL".
       01  Rl-File-Spec   pic x(64) value spaces.

       01  Fd-Path        pic x(64) value "./".
       01  Fd-File-Name   pic x(32) value "DS.DS".
       01  Fd-File-Spec   pic x(128) value spaces.

       01  File-Name      pic x(32) value spaces.
       01  File-Path      pic x(128) value spaces.
       01  File-Spec      pic x(128) value spaces.

       01  Rl-Column-Hdr  pic x(81) value
           "Data Name                     Format         Type           
      -    "N-Len  Pos  F-Len".
       01  Rl-Separator   pic x(81) value 
           "----------------------------- -------------- -------------- 
      -    "----- ----- -----".
       01  Rl-Total-Sep   pic x(81) value 
           "                                                            
      -    "            -----".

       01  Rl-rec.
           02  f-name     pic x(30) value spaces.
           02  f-fmt      pic x(15) value spaces.
           02  f-type     pic x(15) value spaces.
           02  f-clen     pic zzzzz value spaces.
           02  f-pos      pic zzzzzz value spaces.
           02  f-flen     pic zzzzzz value spaces.
       01  f-fields redefines Rl-rec.
           02  f-t2       pic x(30) value spaces.
           02  f-t4       pic x(15) value spaces.
           02  f-t5       pic x(15) value spaces.
           02  f-x1       pic x(5) value spaces.
           02  f-x2       pic x(6) value spaces.
           02  f-x3       pic x(6) value spaces.

       01  Rl-Rec-Len     pic 9(4) binary value 0.
       01  len            pic 9(4) binary value 0.
       01  flen           pic 9(4) binary value 0.
       01  f-elements     pic 9(4) binary value 0.
       01  rl-pos         pic 9(4) binary value 0.
       01  Tmp-File-Spec  pic x(128) value spaces.

       procedure division.

       Initizlization.
           move function module-id to pgm-id.

       Open-Fd-File.
           move Fd-Path      to File-Path.
           move Fd-File-Name to File-Name.
           perform Build-File-Spec.
           move File-Spec  to Fd-File-Spec.
           open input Fd-File.
           if Fs1 not = "00"
               display pgm-id " failed to open input:"
                   Fd-File-Spec
               move 1 to Exit-Code
               go to End-Program.

       Open-Rl-File.
           move Rl-Path      to File-Path.
           move Rl-File-Name to File-Name.
           perform Build-File-Spec.
           move File-Spec  to Rl-File-Spec.
           open output Rl-File.
           if Fs1 not = "00"
               display pgm-id " failed to open output: "
                   Rl-File-Spec
               move 1 to Exit-Code
               go to End-Program.
           move 1 to rl-pos.
           write Rl-File-Record from Rl-Column-Hdr.
           write Rl-File-Record from Rl-Separator.

      * DS-ANALYZER.CBL, created by DS-PARSER.CBL, submits
      * data-names to the GNUCOBOL runtime to determine field
      * lengths. RL.CBL is essentially just shell providing
      * runtime support for DS-ANALYZER.CBL. 

       copy "DS-ANALYZER.CBL".

           initialize Rl-rec.
           subtract 1 from rl-pos.
           move rl-pos to f-flen.
           move 0 to f-pos.
           move 0 to f-clen.
           write Rl-File-Record from Rl-Total-Sep.
           move "          Total" to f-t4.
           perform Write-Rl.
           go to End-Program.

       Write-Rl.
           write Rl-File-Record from Rl-Rec.

       End-Program.
           close Rl-File.
           close Fd-File.
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
