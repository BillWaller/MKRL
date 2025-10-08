      * level 01
           move "Dinc-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Dinc-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Dinc-Key" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Dinc-Key to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "Dinc-Date" to f-name.
           move "zzzzz9" to f-t4.
           move spaces to f-t5.
           move length Dinc-Date to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Dinc-Bsta" to f-name.
           move "OCCURS(2)" to f-t4.
           move spaces to f-t5.
           move 0 to f-flen flen f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "Dinc-Class" to f-name.
           move "OCCURS(12)" to f-t4.
           move spaces to f-t5.
           move 0 to f-flen flen f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 04
           move "Dinc-Amount" to f-name.
           move "s9(9)v9(2)" to f-t4.
           move "COMP-3" to f-t5.
           move length Dinc-Amount to len.
           multiply 0024 by len.
           move len to f-flen flen.
           move 0 to f-clen.
           move 0 to f-elements.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

