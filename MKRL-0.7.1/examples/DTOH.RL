Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Order-Header                                                  194     1
Oh-Custid                     x(6)                                    1     6
Oh-Key                                                          8     7
Oh-Ordno                      zzzzz9                                  7     6
Oh-Detno                      99                                     13     2
Oh-Cust-Name                  x(26)                                  15    26
Oh-Coop                       x(20)                                  41    20
Oh-Pkgprice                   s9(7)v9(2)     COMP-3                  61     5
Oh-Sba                        s9(7)v9(2)     COMP-3                  66     5
Oh-Glkey                      9(2)                                   71     2
Oh-Sp                         9(2)                                   73     2
Oh-Spcomm                     s9(2)v9(3)     COMP-3                  75     3
Oh-Agyno                      s9(3)          COMP-3                  78     2
Oh-Agycomm                    s9(2)v9(3)     COMP-3                  80     3
Oh-Agygl                      9(2)                                   83     2
Oh-Repno                      s9(3)          COMP-3                  85     2
Oh-Repcomm                    s9(2)v9(3)     COMP-3                  87     3
Oh-Repgl                      9(2)                                   90     2
Oh-Cycle                      9(1)                                   92     1
Oh-Type                       9(1)                                   93     1
Oh-Intcode                    9(1)                                   94     1
Oh-Bsta                       9(1)                                   95     1
Oh-Class                      9(2)                                   96     2
Oh-Affd                       9(1)                                   98     1
Oh-Curramt                    s9(7)v9(2)     COMP-3                  99     5
Oh-Nextamt                    s9(7)v9(2)     COMP-3                 104     5
Oh-Totamt                     s9(7)v9(2)     COMP-3                 109     5
Oh-To-Date-Amt                s9(7)v9(2)     COMP-3                 114     5
Oh-Update-Code                s9(3)          COMP-3                 119     2
Oh-Exp-Date                   s9(7)          COMP-3                 121     4
Oh-Next-Det                   9(2)                                  125     2
Oh-Sales-Tax-State            99             COMP-3                 127     2
Oh-Bcode                      9(1)                                  129     1
Oh-Invno                      x(6)                                  130     6
Oh-Bfrom                      9(1)                                  136     1
Oh-Ag-Id                      x(6)                                  137     6
Oh-Bc-Cont-No                 x                                     143     1
Oh-Inv-Group                  x                                     144     1
fn001                         x(5)                                  145     5
Oh-Inst                       x(45)                                 150    45
                                                                        -----
                                        Total                             194
