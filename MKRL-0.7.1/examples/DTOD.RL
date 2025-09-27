Data Name                     Format         Type           N-Len  Pos  F-Len
----------------------------- -------------- -------------- ----- ----- -----
Order-Detail                                                  194     1
Od-Custid                     x(6)                                    1     6
Od-Key                                                          8     7
Od-Ordno                      zzzzz9                                  7     6
Od-Detno                      99                                     13     2
Od-Ordtype                    s9(3)          COMP-3                  15     2
Od-Bdesc                      x(20)                                  17    20
Od-Urate                      s9(5)v9(2)     COMP-3                  37     4
Od-Startd                     s9(7)          COMP-3                  41     4
Od-Endd                       s9(7)          COMP-3                  45     4
Od-Stime                      s9(5)v9(2)     COMP-3                  49     4
Od-Etime                      s9(5)v9(2)     COMP-3                  53     4
Od-Atime                      9(2)                                   57     2
Od-Logsta                     9(1)                                   59     1
Od-Prdcode                    s9(3)          COMP-3                  60     2
Od-Pri                        9(1)                                   62     1
Od-Cart                       x(4)                                   63     4
Od-Length                     s9(5)          COMP-3                  67     3
Od-Type                       x(4)                                   70     4
Od-Wkday-Tbl                  OCCURS(7)                              74
Od-Wkday                      s9(3)          COMP-3                  74    14
Od-Altcode                    9(1)                                   88     1
Od-Startg                     s9(7)          COMP-3                  89     4
Od-Endg                       s9(7)          COMP-3                  93     4
Od-Curranns                   s9(7)          COMP-3                  97     4
Od-Nextanns                   s9(7)          COMP-3                 101     4
Od-Totanns                    s9(7)          COMP-3                 105     4
Od-Curramt                    s9(7)v9(2)     COMP-3                 109     5
Od-Nextamt                    s9(7)v9(2)     COMP-3                 114     5
Od-Totamt                     s9(7)v9(2)     COMP-3                 119     5
Od-Ahs                        9(1)                                  124     1
Od-Hspots                     9(3)                                  125     3
Od-Hwkday-Tbl                 OCCURS(7)                             128
Od-Hwkday                     9                                     128     7
Od-Tal-No                     9(2)                                  135     2
Od-Tal-Per                    s9(2)v9(3)     COMP-3                 137     3
Od-Tal-Amt                    s9(7)v9(2)     COMP-3                 140     5
Od-Hsflag                     x(1)                                  145     1
Od-Group                      9(4)                                  146     4
Od-Inst                       x(45)                                 150    45
                                                                        -----
                                        Total                             194
