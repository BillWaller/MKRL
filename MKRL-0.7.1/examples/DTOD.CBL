       01  Order-Detail.
           02  Od-Custid          pic x(6).
           02  Od-Key.
               03  Od-Ordno       pic zzzzz9.
               03  Od-Detno       pic 99.
           02  Od-Ordtype         pic s9(3) COMP-3.
           02  Od-Bdesc           pic x(20).
           02  Od-Urate           pic s9(5)v9(2) COMP-3.
           02  Od-Startd          pic s9(7) COMP-3.
           02  Od-Endd            pic s9(7) COMP-3.
           02  Od-Stime           pic s9(5)v9(2) COMP-3.
           02  Od-Etime           pic s9(5)v9(2) COMP-3.
           02  Od-Atime           pic 9(2).
           02  Od-Logsta          pic 9(1).
           02  Od-Prdcode         pic s9(3) COMP-3.
           02  Od-Pri             pic 9(1).
           02  Od-Cart            pic x(4).
           02  Od-Length          pic s9(5) COMP-3.
           02  Od-Type            pic x(4).
           02  Od-Wkday-Tbl occurs 7 times.
               03  Od-Wkday       pic s9(3) COMP-3.
           02  Od-Altcode         pic 9(1).
           02  Od-Startg          pic s9(7) COMP-3.
           02  Od-Endg            pic s9(7) COMP-3.
           02  Od-Curranns        pic s9(7) COMP-3.
           02  Od-Nextanns        pic s9(7) COMP-3.
           02  Od-Totanns         pic s9(7) COMP-3.
           02  Od-Curramt         pic s9(7)v9(2) COMP-3.
           02  Od-Nextamt         pic s9(7)v9(2) COMP-3.
           02  Od-Totamt          pic s9(7)v9(2) COMP-3.
           02  Od-Ahs             pic 9(1).
           02  Od-Hspots          pic 9(3).
           02  Od-Hwkday-Tbl occurs 7 times.
               03  Od-Hwkday      pic 9.
           02  Od-Tal-No          pic 9(2).
           02  Od-Tal-Per         pic s9(2)v9(3) COMP-3.
           02  Od-Tal-Amt         pic s9(7)v9(2) COMP-3.
           02  Od-Hsflag          pic x(1).
           02  Od-Group           pic 9(4).
           02  Od-Inst            pic x(45).
