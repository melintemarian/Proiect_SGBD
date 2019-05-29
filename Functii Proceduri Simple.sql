Drop function Cautare_Trasee;
create or replace function Cautare_Trasee(statia_plecare in varchar2,statia_sosire in varchar2)
return SYS_REFCURSOR
is
    cursorul SYS_REFCURSOR;
    input_inexistent EXCEPTION;
    PRAGMA EXCEPTION_INIT(input_inexistent, -20001);
        begin
            if(statia_sosire=NULL or statia_sosire=NULL) then
            raise input_inexistent;
            end if;
            Open cursorul for select st.nume_statie,ss.NUME_STATIE,tr.ORA_PLECARE,tr.ORA_SOSIRE,ID_TRASEU from statii st
            join TRASEU tr on st.ID_STATIE=tr.ID_STATIE_PLECARE
            join statii ss on tr.ID_STATIE_SOSIRE=ss.ID_STATIE
            where st.NUME_STATIE=statia_plecare and ss.Nume_statie=statia_sosire;
            EXCEPTION
            WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
            WHEN input_inexistent THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
            return cursorul;
        end;
    /

drop function  Cautare_Statii_Plecare;
create or replace function Cautare_Statii_Plecare(denumire_statie in varchar2)
return sys_refcursor
is
    cursorul sys_refcursor;
    input_inexistent EXCEPTION;
    PRAGMA EXCEPTION_INIT(input_inexistent, -20001);
        begin
            if(denumire_statie=NULL) then
            raise input_inexistent;
            end if;
            Open cursorul for
                select st.NUME_STATIE,ss.NUME_STATIE,ORA_PLECARE,ID_TRASEU from statii st
                join traseu ts on ts.ID_STATIE_PLECARE=st.ID_STATIE
                join statii ss on ss.ID_STATIE=ts.ID_STATIE_SOSIRE
                where st.NUME_STATIE=trim(denumire_statie);
            EXCEPTION
            WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
            WHEN input_inexistent then
            DBMS_OUTPUT.PUT_LINE('Niciun input gasit.');
            return cursorul;
        end;
    /

drop function  Cautare_Statii_Sosire;
create or replace function Cautare_Statii_Sosire(denumire_statie in varchar2)
return sys_refcursor
is
    cursorul sys_refcursor;
    input_inexistent EXCEPTION;
    PRAGMA EXCEPTION_INIT(input_inexistent, -20001);
        begin
            if(denumire_statie=NULL) then
            raise input_inexistent;
            end if;
            Open cursorul for
                select ss.NUME_STATIE,st.NUME_STATIE,ORA_SOSIRE,ID_TRASEU from statii st
                join traseu ts on ts.ID_STATIE_SOSIRE=st.ID_STATIE
                join statii ss on ss.ID_STATIE=ts.ID_STATIE_PLECARE
                where st.NUME_STATIE=trim(denumire_statie);
            EXCEPTION
            WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
            WHEN input_inexistent then
            DBMS_OUTPUT.PUT_LINE('Niciun input gasit.');
            return cursorul;
        end;
    /

Drop function Cautare_Stare_Traseu;
create or replace function Cautare_Stare_Traseu(id_traseu_cautat int)
return sys_refcursor
is
    cursorul sys_refcursor;
    input_inexistent EXCEPTION;
    PRAGMA EXCEPTION_INIT(input_inexistent, -20001);
        begin
            if(id_traseu_cautat=NULL) then
            raise input_inexistent;
            end if;
            Open cursorul for
                select ID_TRASEU,st1.NUME_STATIE,st2.NUME_STATIE,STARE_TREN,INTARZIERE from TRASEU tr
                join statii st1 on st1.ID_STATIE=tr.ID_STATIE_PLECARE
                join statii st2 on st2.ID_STATIE=tr.ID_STATIE_SOSIRE
                where ID_TRASEU=id_traseu_cautat;
            EXCEPTION
            WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
            WHEN input_inexistent then
            DBMS_OUTPUT.PUT_LINE('Niciun input gasit.');
            return cursorul;
        end;
/

Drop function Cautare_mentenanta;
Create or replace function Cautare_mentenanta(id_locomotiva_s int)
return sys_refcursor
is
    cursorul sys_refcursor;
    input_inexistent EXCEPTION;
    PRAGMA EXCEPTION_INIT(input_inexistent, -20001);
        begin
            if(id_locomotiva_s=NULL) then
            raise input_inexistent;
            end if;
            open cursorul for
                select ID_REPARARE,M2.ID_LOCOMOTIVA,DATA_ADAUGARE,DATA_ELIBERARE,s2.NUME_STATIE from MENTENANTA M2
                join LOCOMOTIVA L2 on M2.ID_LOCOMOTIVA = L2.ID_LOCOMOTIVA
                join STATII S2 on L2.ID_STATIE_DOMICILIU = S2.ID_STATIE
                where M2.ID_LOCOMOTIVA=id_locomotiva_s;
            EXCEPTION
            WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
            WHEN input_inexistent then
            DBMS_OUTPUT.PUT_LINE('Niciun input gasit.');
            return cursorul;
        end;
    /

Drop procedure Adaugare_Intarziere;
Create Or replace procedure Adaugare_Intarziere(intarziere_s int, id_traseu_s int)
is
begin
    update TRASEU set INTARZIERE=INTARZIERE+intarziere_s where ID_TRASEU=id_traseu_s;
end;
/

Drop procedure Eliminiare_Intarziere;
Create or replace  procedure Eliminiare_Intarziere(intarziere_s int, id_traseu_s int)
is
begin
    update TRASEU set INTARZIERE=0 where ID_TRASEU=id_traseu_s;
end;
/

Drop procedure  Cautare_reparare_statie;
Create or replace function Cautare_reparare_statie(id_statie_s int)
return sys_refcursor
is
    cursorul sys_refcursor;
    input_inexistent EXCEPTION;
    PRAGMA EXCEPTION_INIT(input_inexistent, -20001);
begin
   if(id_statie_s=NULL) then
            raise input_inexistent;
            end if;
        open cursorul for
            select NUME_STATIE,ID_REPARARE,mt.ID_LOCOMOTIVA,DATA_ADAUGARE,DATA_ELIBERARE from MENTENANTA mt
            join statii st on st.ID_STATIE=mt.ID_STATIE
            where st.NUME_STATIE=id_statie_s;
    EXCEPTION
    WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Niciun rezultat gasit.');
    WHEN input_inexistent then
            DBMS_OUTPUT.PUT_LINE('Niciun input gasit.');
            return cursorul;

end;
/