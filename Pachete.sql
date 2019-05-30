Create package Proceduri_Proiect as
    PROCEDURE REBALANSARE;
    PROCEDURE ELIMINIARE_INTARZIERE(id_traseu_s int);
    PROCEDURE ADAUGARE_INTARZIERE(intarziere_s int, id_traseu_s int);
        end Proceduri_Proiect;

Create Package Functii_Proiect as
    FUNCTION Cautare_mentenanta(id_locomotiva_s int) return sys_refcursor;
    function Cautare_Stare_Traseu(id_traseu_cautat int) return sys_refcursor;
    FUNCTION Cautare_Statii_Sosire(denumire_statie in varchar2) return sys_refcursor;
    FUNCTION Cautare_Statii_Plecare(denumire_statie in varchar2) return  sys_refcursor;
    function Cautare_Trasee(statia_plecare in varchar2,statia_sosire in varchar2) return sys_refcursor;
    end Functii_Proiect;

CREATE OR REPLACE PACKAGE BODY Proceduri_Proiect AS

end;

CREATE OR REPLACE PACKAGE BODY Functii_Proiect AS

end;