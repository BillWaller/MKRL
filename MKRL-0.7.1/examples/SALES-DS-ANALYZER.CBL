      * level 01
           move "Sales-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Sales-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Sales-File-Key" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Sales-File-Key to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "S-Product-ID" to f-name.
           move "x(6)" to f-t4.
           move spaces to f-t5.
           move length S-Product-ID to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "S-Year" to f-name.
           move "9(4)" to f-t4.
           move spaces to f-t5.
           move length S-Year to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "S-Region" to f-name.
           move "OCCURS(2)" to f-t4.
           move spaces to f-t5.
           move 0 to f-flen flen f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "S-Month" to f-name.
           move "OCCURS(12)" to f-t4.
           move spaces to f-t5.
           move 0 to f-flen flen f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 04
           move "S-Amount" to f-name.
           move "s9(9)v9(2)" to f-t4.
           move "COMP-3" to f-t5.
           move length S-Amount to len.
           multiply 0024 by len.
           move len to f-flen flen.
           move 0 to f-clen.
           move 0 to f-elements.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "S-Product-Desc" to f-name.
           move "x(30)" to f-t4.
           move spaces to f-t5.
           move length S-Product-Desc to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

