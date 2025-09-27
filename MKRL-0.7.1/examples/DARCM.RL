Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Darcm-File-Record                                             400     1
Cm-Custid                     x(6)                                    1     6
Cm-Cust-Name                  x(36)                                   7    36
Cm-Addr1                      x(34)                                  43    34
Cm-Addr2                      x(34)                                  77    34
Cm-City                       x(18)                                 111    18
Cm-State                      x(2)                                  129     2
Cm-Zip                        x(10)                                 131    10
Cm-Tel                        x(18)                                 141    18
Cm-Contact                    x(22)                                 159    22
Cm-Prdcode                    s9(3)          COMP-3                 181     2
Cm-Sp                         99                                    183     2
Cm-Spcomm                     s99v9(3)       COMP-3                 185     3
Cm-Ag-Id                      x(6)                                  188     6
Cm-Agycomm                    s99v9(3)       COMP-3                 194     3
Cm-Agygl                      99                                    197     2
Cm-Repno                      s9(3)          COMP-3                 199     2
Cm-Repcomm                    s99v9(3)       COMP-3                 201     3
Cm-Repgl                      99                                    204     2
Cm-Cycle                      9                                     206     1
Cm-Type                       9                                     207     1
Cm-Intcode                    9                                     208     1
Cm-Bsta                       9                                     209     1
Cm-Class                      99                                    210     2
Cm-Affd                       9                                     212     1
Cm-Annv                       s9(9)          COMP-3                 213     5
Cm-Ladate                     s9(7)          COMP-3                 218     4
Cm-Actin                      9                                     222     1
Cm-S1-Last-Stmt-Date          s9(7)          COMP-3                 223     4
Cm-S1-Last-Pmt-Date           s9(7)          COMP-3                 227     4
Cm-S1-Last-Pmt-Amount         s9(9)v99       COMP-3                 231     6
Cm-S1-Billed-Ytd              s9(9)v99       COMP-3                 237     6
Cm-S1-Interest-Due            s9(9)v99       COMP-3                 243     6
Cm-S1-Balance-Forward         s9(9)v99       COMP-3                 249     6
Cm-S1-Current-Balance         s9(9)v99       COMP-3                 255     6
Cm-S1-First-Link              s9(9)          COMP-3                 261     5
Cm-S1-Last-Link               s9(9)          COMP-3                 266     5
Cm-S1-History-Link            s9(9)          COMP-3                 271     5
Cm-S2-Last-Stmt-Date          s9(7)          COMP-3                 276     4
Cm-S2-Last-Pmt-Date           s9(7)          COMP-3                 280     4
Cm-S2-Last-Pmt-Amount         s9(9)v99       COMP-3                 284     6
Cm-S2-Billed-Ytd              s9(9)v99       COMP-3                 290     6
Cm-S2-Interest-Due            s9(9)v99       COMP-3                 296     6
Cm-S2-Balance-Forward         s9(9)v99       COMP-3                 302     6
Cm-S2-Current-Balance         s9(9)v99       COMP-3                 308     6
Cm-S2-First-Link              s9(9)          COMP-3                 314     5
Cm-S2-Last-Link               s9(9)          COMP-3                 319     5
Cm-S2-History-Link            s9(9)          COMP-3                 324     5
Cm-Max-Link                   s9(9)          COMP-3                 329     5
Cm-Credit-Limit               s9(9)v99                              334    11
Cm-Update-Code                9                                     345     1
Cm-Sales-Tax-State            99             COMP-3                 346     2
Cm-Bfrom                      9                                     348     1
Cm-Agyno                      s9(3)          COMP-3                 349     2
Cm-Comment                    x(50)                                 351    50
                                                                        -----
                                        Total                             400
