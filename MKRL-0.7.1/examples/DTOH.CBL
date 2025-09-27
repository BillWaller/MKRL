       01  Order-Header.
           02  Oh-Custid          pic x(6).
           02  Oh-Key.
               03  Oh-Ordno       pic zzzzz9.
               03  Oh-Detno       pic 99.
           02  Oh-Cust-Name       pic x(26).
           02  Oh-Coop            pic x(20).
           02  Oh-Pkgprice        pic s9(7)v9(2) COMP-3.
           02  Oh-Sba             pic s9(7)v9(2) COMP-3.
           02  Oh-Glkey           pic 9(2).
           02  Oh-Sp              pic 9(2).
           02  Oh-Spcomm          pic s9(2)v9(3) COMP-3.
           02  Oh-Agyno           pic s9(3) COMP-3.
           02  Oh-Agycomm         pic s9(2)v9(3) COMP-3.
           02  Oh-Agygl           pic 9(2).
           02  Oh-Repno           pic s9(3) COMP-3.
           02  Oh-Repcomm         pic s9(2)v9(3) COMP-3.
           02  Oh-Repgl           pic 9(2).
           02  Oh-Cycle           pic 9(1).
           02  Oh-Type            pic 9(1).
           02  Oh-Intcode         pic 9(1).
           02  Oh-Bsta            pic 9(1).
           02  Oh-Class           pic 9(2).
           02  Oh-Affd            pic 9(1).
           02  Oh-Curramt         pic s9(7)v9(2) COMP-3.
           02  Oh-Nextamt         pic s9(7)v9(2) COMP-3.
           02  Oh-Totamt          pic s9(7)v9(2) COMP-3.
           02  Oh-To-Date-Amt     pic s9(7)v9(2) COMP-3.
           02  Oh-Update-Code     pic s9(3) COMP-3.
           02  Oh-Exp-Date        pic s9(7) COMP-3.
           02  Oh-Next-Det        pic 9(2).
           02  Oh-Sales-Tax-State pic 99 COMP-3.
           02  Oh-Bcode           pic 9(1).
           02  Oh-Invno           pic x(6).
           02  Oh-Bfrom           pic 9(1).
           02  Oh-Ag-Id           pic x(6).
           02  Oh-Bc-Cont-No      pic x.
           02  Oh-Inv-Group       pic x.
           02                     pic x(5).
           02  Oh-Inst            pic x(45).
