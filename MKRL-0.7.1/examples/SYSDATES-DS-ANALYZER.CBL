      * level 01
           move "Sysdates-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Sysdates-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Cstart-Yyyymmdd" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Cstart-Yyyymmdd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Cstart" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Cstart to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Cstart-wday" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length sd-Cstart-wday to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Cend-Yyyymmdd" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Cend-Yyyymmdd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Cend" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Cend to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Sbstart-Yyyymmdd" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Sbstart-Yyyymmdd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Sbstart" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Sbstart to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Sbend-Yyyymmdd" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Sbend-Yyyymmdd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "sd-Sbend" to f-name.
           move "9(8)" to f-t4.
           move "COMP-3" to f-t5.
           move length sd-Sbend to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

