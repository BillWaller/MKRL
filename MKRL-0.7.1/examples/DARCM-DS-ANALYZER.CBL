      * level 01
           move "Darcm-File-Record" to f-name.
           move spaces to f-t4.
           move spaces to f-t5.
           move length Darcm-File-Record to len.
           move len to f-clen.
           move 0 to f-flen flen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Custid" to f-name.
           move "x(6)" to f-t4.
           move spaces to f-t5.
           move length Cm-Custid to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Cust-Name" to f-name.
           move "x(36)" to f-t4.
           move spaces to f-t5.
           move length Cm-Cust-Name to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Addr1" to f-name.
           move "x(34)" to f-t4.
           move spaces to f-t5.
           move length Cm-Addr1 to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Addr2" to f-name.
           move "x(34)" to f-t4.
           move spaces to f-t5.
           move length Cm-Addr2 to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-City" to f-name.
           move "x(18)" to f-t4.
           move spaces to f-t5.
           move length Cm-City to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-State" to f-name.
           move "x(2)" to f-t4.
           move spaces to f-t5.
           move length Cm-State to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Zip" to f-name.
           move "x(10)" to f-t4.
           move spaces to f-t5.
           move length Cm-Zip to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Tel" to f-name.
           move "x(18)" to f-t4.
           move spaces to f-t5.
           move length Cm-Tel to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Contact" to f-name.
           move "x(22)" to f-t4.
           move spaces to f-t5.
           move length Cm-Contact to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Prdcode" to f-name.
           move "s9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Prdcode to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Sp" to f-name.
           move "99" to f-t4.
           move spaces to f-t5.
           move length Cm-Sp to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Spcomm" to f-name.
           move "s99v9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Spcomm to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Ag-Id" to f-name.
           move "x(6)" to f-t4.
           move spaces to f-t5.
           move length Cm-Ag-Id to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Agycomm" to f-name.
           move "s99v9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Agycomm to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Agygl" to f-name.
           move "99" to f-t4.
           move spaces to f-t5.
           move length Cm-Agygl to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Repno" to f-name.
           move "s9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Repno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Repcomm" to f-name.
           move "s99v9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Repcomm to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Repgl" to f-name.
           move "99" to f-t4.
           move spaces to f-t5.
           move length Cm-Repgl to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Cycle" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Cycle to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Type" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Type to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Intcode" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Intcode to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Bsta" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Bsta to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Class" to f-name.
           move "99" to f-t4.
           move spaces to f-t5.
           move length Cm-Class to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Affd" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Affd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Annv" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Annv to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Ladate" to f-name.
           move "s9(7)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Ladate to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Actin" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Actin to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Last-Stmt-Date" to f-name.
           move "s9(7)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Last-Stmt-Date to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Last-Pmt-Date" to f-name.
           move "s9(7)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Last-Pmt-Date to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Last-Pmt-Amount" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Last-Pmt-Amount to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Billed-Ytd" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Billed-Ytd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Interest-Due" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Interest-Due to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Balance-Forward" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Balance-Forward to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Current-Balance" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Current-Balance to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-First-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-First-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-Last-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-Last-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S1-History-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S1-History-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Last-Stmt-Date" to f-name.
           move "s9(7)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Last-Stmt-Date to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Last-Pmt-Date" to f-name.
           move "s9(7)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Last-Pmt-Date to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Last-Pmt-Amount" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Last-Pmt-Amount to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Billed-Ytd" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Billed-Ytd to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Interest-Due" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Interest-Due to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Balance-Forward" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Balance-Forward to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Current-Balance" to f-name.
           move "s9(9)v99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Current-Balance to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-First-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-First-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-Last-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-Last-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-S2-History-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-S2-History-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Max-Link" to f-name.
           move "s9(9)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Max-Link to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Credit-Limit" to f-name.
           move "s9(9)v99" to f-t4.
           move spaces to f-t5.
           move length Cm-Credit-Limit to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Update-Code" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Update-Code to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Sales-Tax-State" to f-name.
           move "99" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Sales-Tax-State to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Bfrom" to f-name.
           move "9" to f-t4.
           move spaces to f-t5.
           move length Cm-Bfrom to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Agyno" to f-name.
           move "s9(3)" to f-t4.
           move "COMP-3" to f-t5.
           move length Cm-Agyno to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

      * level 02
           move "Cm-Comment" to f-name.
           move "x(50)" to f-t4.
           move spaces to f-t5.
           move length Cm-Comment to len.
           move len to f-flen flen.
           move 0 to f-clen.
           move rl-pos to f-pos.
           perform Write-Rl.
           add flen to rl-pos.

