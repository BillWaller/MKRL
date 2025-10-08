Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Sales-File-Record                                             184     1
Sales-File-Key                                                 10     1
S-Product-ID                  x(6)                                    1     6
S-Year                        9(4)                                    7     4
S-Region                      OCCURS(2)                              11
S-Month                       OCCURS(12)                             11
S-Amount                      s9(9)v9(2)     COMP-3                  11   144
S-Product-Desc                x(30)                                 155    30
                                                                        -----
                                        Total                             184
