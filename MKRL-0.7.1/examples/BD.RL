Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Bd-File-Record                                                182     1      
Bd-Custid-Key                                                         1      
Bd-Custid                     x(6)                                    1     6
Bd-Key                                                                7      
Bd-Ordno                      zzzzz9                                  7     6
Bd-Bill-Custid                x(6)                                   13     6
Bd-Ref                        9999                                   19     4
Bd-Ag-Id                      x(6)                                   23     6
Bd-Type                       x                                      29     1
Bd-Cust-Name                  x(36)                                  30    36
Bd-Addr1                      x(36)                                  66    36
Bd-Addr2                      x(36)                                 102    36
Bd-City                       x(18)                                 138    18
Bd-State                      x(2)                                  156     2
Bd-Zip                        x(10)                                 158    10
Bd-Confirmation               x                                     168     1
Bd-Affidavit                  x                                     169     1
Bd-Statement                  x                                     170     1
Bd-Bsta                       9                                     171     1
Bd-Glkey                      9(2)                                  172     2
Bd-Fixed-Amount               s9(7)v9(2)     COMP-3                 174     5
Bd-Percent                    s9(3)v9(3)     COMP-3                 179     4
                                                                        -----
                                        Total               182
