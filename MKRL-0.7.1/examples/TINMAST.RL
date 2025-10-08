
Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Tinmast-File-Record                                           106     1
Ti-Custid                     x(6)                                    1     6
Ti-Transno                    9(9)                                    7     9
Ti-Date                       9(6)                                   16     6
Ti-Ordno                      s9(7)          COMP-3                  22     4
Ti-Sp                         s9(3)          COMP-3                  26     2
Ti-Desc                       x(20)                                  28    20
Ti-Trnscode                   9                                      48     1
Ti-Postcode                   9                                      49     1
Ti-Intcode                    9                                      50     1
Ti-Spcomm                     s99v9(3)       COMP-3                  51     3
Ti-Noanns                     s9(5)          COMP-3                  54     3
Ti-Annlen                     s9(5)          COMP-3                  57     3
Ti-Nopgms                     s9(5)          COMP-3                  60     3
Ti-Pgmlen                     s9(5)          COMP-3                  63     3
Ti-Urate                      s9(7)v99       COMP-3                  66     5
Ti-Pkgprice                   s9(7)v99       COMP-3                  71     5
Ti-Glkey                      99                                     76     2
Ti-Dramt                      s9(9)v99       COMP-3                  78     6
Ti-Cramt                      s9(9)v99       COMP-3                  84     6
Ti-Orgamt                     s9(9)v99       COMP-3                  90     6
Ti-Bsta                       9                                      96     1
Ti-Type                       9                                      97     1
Ti-Invno                      9(6)                                   98     6
Ti-Prdcode                    9(3)                                  104     3
                                                                        -----
                                        Total                             106
