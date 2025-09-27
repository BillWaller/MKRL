      * level 01
           move "Dtom-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Dtom-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Om-Custid-Key" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Om-Custid-Key to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "Om-Custid" to f-name.
           move "x(6)" to f-t4.
           move spaces to f-t5.
           move length Om-Custid to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 03
           move "Om-Key" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Om-Key to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 04
           move "Om-Ordno" to f-name.
           move "zzzzz9" to f-t4.
           move spaces to f-t5.
           move length Om-Ordno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 04
           move "Om-Detno" to f-name.
           move "99" to f-t4.
           move spaces to f-t5.
           move length Om-Detno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "fn001" to f-name.
           move "x(180)" to f-t4.
           move spaces to f-t5.
           move length fn001 to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

