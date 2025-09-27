      * level 01
           move "Darsp-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Darsp-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Sp-Name-Rows" to f-name.
           move "OCCURS(99)" to f-t4.
           move spaces to f-t5.
           move 0 to f-flen flen f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "Sp-Name" to f-name.
           move "x(30)" to f-t4.
           move spaces to f-t5.
           move length Sp-Name to len.
           multiply 0099 by len.
           move len to f-flen flen.
           move 0 to f-clen.
           move 0 to f-elements.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

