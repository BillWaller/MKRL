      * level 01
           move "Tinmast-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Tinmast-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Custid" to f-name.
           move "x(6)" to f-t4.
           move spaces to f-t5.
           move length Ti-Custid to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Transno" to f-name.
           move "9(9)" to f-t4.
           move spaces to f-t5.
           move length Ti-Transno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Date" to f-name.
           move "9(6)" to f-t4.
           move spaces to f-t5.
           move length Ti-Date to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Ordno" to f-name.
           move "s9(7)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Ordno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Sp" to f-name.
           move "s9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Sp to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Desc" to f-name.
           move "x(20)" to f-t4.
           move spaces to f-t5.
           move length Ti-Desc to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Trnscode" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Ti-Trnscode to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Postcode" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Ti-Postcode to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Intcode" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Ti-Intcode to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Spcomm" to f-name.
           move "s99v9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Spcomm to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Noanns" to f-name.
           move "s9(5)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Noanns to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Annlen" to f-name.
           move "s9(5)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Annlen to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Nopgms" to f-name.
           move "s9(5)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Nopgms to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Pgmlen" to f-name.
           move "s9(5)" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Pgmlen to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Urate" to f-name.
           move "s9(7)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Urate to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Pkgprice" to f-name.
           move "s9(7)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Pkgprice to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Glkey" to f-name.
           move "99" to f-t4.
           move spaces to f-t5.
           move length Ti-Glkey to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Dramt" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Dramt to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Cramt" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Cramt to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Orgamt" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Ti-Orgamt to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Bsta" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Ti-Bsta to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Type" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Ti-Type to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Invno" to f-name.
           move "9(6)" to f-t4.
           move spaces to f-t5.
           move length Ti-Invno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Ti-Prdcode" to f-name.
           move "9(3)" to f-t4.
           move spaces to f-t5.
           move length Ti-Prdcode to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

