drop procedure Rebalansare;
create or replace procedure Rebalansare
is
    type sir is varray(10) of int;
    liber sir;
    ocupat sir;
    cursor c1  is
        select * from (select bt.ID_TRASEU from BILETE bt
        join traseu ts on ts.ID_TRASEU=bt.ID_TRASEU
        group by bt.ID_TRASEU,ZIUA,NUMAR_VAGOANE having NUMAR_VAGOANE*100-count(id_bilet)>100
        order by count(id_bilet)) where ROWNUM<11;
    cursor c2 is
        select * from (select bt.ID_TRASEU from BILETE bt
        join traseu ts on ts.ID_TRASEU=bt.ID_TRASEU
        group by bt.ID_TRASEU,ZIUA,NUMAR_VAGOANE having NUMAR_VAGOANE*100-count(id_bilet)<100
        order by count(id_bilet) desc) where ROWNUM<11;
    begin
        open c1;
        fetch c1 bulk collect into liber;
        close c1;
        open c2;
        fetch c2 bulk collect into ocupat;
        close c2;
        FOR i IN liber.FIRST .. liber.LAST
        LOOP
        update Traseu set NUMAR_VAGOANE=NUMAR_VAGOANE-1 where ID_TRASEU=liber(i);
        update Traseu set NUMAR_VAGOANE=NUMAR_VAGOANE+1 where ID_TRASEU=ocupat(i);
        DBMS_OUTPUT.PUT_LINE('Am luat un vagon de la '||liber(i)||' si l-am pus la ' ||ocupat(i));
        END LOOP;
    end;