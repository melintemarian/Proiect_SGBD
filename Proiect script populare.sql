DROP TABLE statii CASCADE CONSTRAINTS
/
DROP TABLE bilete CASCADE CONSTRAINTS
/
DROP TABLE mentenanta CASCADE CONSTRAINTS
/
DROP TABLE traseu CASCADE CONSTRAINTS
/
DROP TABLE locomotiva CASCADE CONSTRAINTS
/

CREATE TABLE statii (
    id_statie INT NOT NULL PRIMARY KEY,
    Nume_Statie Varchar2(30) not null
)
/

CREATE TABLE bilete (
    id_bilet INT NOT NULL PRIMARY KEY,
    id_traseu int not null,
    id_statie_cumparare int not null,
    vagonul int not null,
    locul int not null check (locul between 11 and 111),
    ziua Date not null
)
/

Create Table mentenanta (
    id_reparare INT NOT NULL PRIMARY KEY,
    id_locomotiva INT,
    id_statie INT,
    data_adaugare date,
    data_eliberare Date
)
/

CREATE TABLE traseu (
    id_traseu INT NOT NULL PRIMARY KEY,
    ora_plecare date not null,
    ora_sosire date not null,
    id_statie_plecare int not null,
    id_statie_sosire int not null,
    intarziere int,
    id_locomotiva int not null,
    numar_vagoane INT check (numar_vagoane between 1 and 11),
    Stare_Tren Varchar2(30)
)
/

Create table locomotiva (
    id_locomotiva INT not null primary key,
    id_statie_domiciliu int not null
)
/

alter table "LOCOMOTIVA" add constraint fk_statie_domiciliu foreign key ("ID_STATIE_DOMICILIU") references "STATII"("ID_STATIE");

alter table "TRASEU" add constraint fk_statie_plecare foreign key("ID_STATIE_PLECARE") references "STATII"("ID_STATIE");
alter table "TRASEU" add constraint fk_statie_sosire foreign key("ID_STATIE_SOSIRE") references "STATII"("ID_STATIE");
alter table "TRASEU" add constraint fk_locomotiva foreign key ("ID_LOCOMOTIVA") references "LOCOMOTIVA"("ID_LOCOMOTIVA");

alter table "BILETE" add constraint fk_bilete_traseu foreign key("ID_TRASEU") references "TRASEU"("ID_TRASEU");
alter table "BILETE" add constraint fk_bilete_cumparate foreign key("ID_STATIE_CUMPARARE") references "STATII"("ID_STATIE");

alter table "MENTENANTA" add constraint fk_reparare_tren foreign key("ID_LOCOMOTIVA") references "LOCOMOTIVA"("ID_LOCOMOTIVA");
alter table "MENTENANTA" add constraint fk_locatie_reparare_tren foreign key("ID_STATIE") references "STATII"("ID_STATIE");

alter table TRASEU add constraint ck_equal_locatii_tren check (id_statie_plecare <> id_statie_sosire);
--alter table BILETE add constraint bilet_unic unique("ID_TRASEU","ID_STATIE_CUMPARARE","VAGONUL","LOCUL","ZIUA");


DECLARE
  TYPE varr iS VARRAY(1000) OF VARCHAR2(255);
  lista_statii varr := varr('Abrud','Adjud','Agnita','Aiud','Alba Iulia','Aleșd','Alexandria','Amara','Anina','Aninoasa','Arad','Ardud','Avrig','Azuga','Babadag','Băbeni','Bacău','Baia de Aramă','Baia de Arieș','Baia Mare','Baia Sprie','Băicoi','Băile Govora','Băile Herculane','Băile Olănești','Băile Tușnad','Băilești','Bălan','Bălcești','Balș','Baraolt','Bârlad','Bechet','Beclean','Beiuș','Berbești','Berești','Bicaz','Bistrița','Blaj','Bocșa','Boldești-Scăeni','Bolintin-Vale','Borșa','Borsec','Botoșani','Brad','Bragadiru','Brăila','Brașov','Breaza','Brezoi','Broșteni','Bucecea','București','Budești','Buftea','Buhuși','Bumbești-Jiu','Bușteni','Buzău','Buziaș','Cajvana','Calafat','Călan','Călărași','Călimănești','Câmpeni','Câmpia Turzii','Câmpina','Câmpulung Moldovenesc','Câmpulung','Caracal','Caransebeș','Carei','Cavnic','Căzănești','Cehu Silvaniei','Cernavodă','Chișineu-Criș','Chitila','Ciacova','Cisnădie','Cluj-Napoca','Codlea','Comănești','Comarnic','Constanța','Copșa Mică','Corabia','Costești','Covasna','Craiova','Cristuru Secuiesc','Cugir','Curtea de Argeș','Curtici','Dăbuleni','Darabani','Dărmănești','Dej','Deta','Deva','Dolhasca','Dorohoi','Drăgănești-Olt','Drăgășani','Dragomirești','Drobeta-Turnu Severin','Dumbrăveni','Eforie','Făgăraș','Făget','Fălticeni','Făurei','Fetești','Fieni','Fierbinți-Târg','Filiași','Flămânzi','Focșani','Frasin','Fundulea','Găești','Galați','Gătaia','Geoagiu','Gheorgheni','Gherla','Ghimbav','Giurgiu','Gura Humorului','Hârlău','Hârșova','Hațeg','Horezu','Huedin','Hunedoara','Huși','Ianca','Iași','Iernut','Ineu','Însurăței','Întorsura Buzăului','Isaccea','Jibou','Jimbolia','Lehliu Gară','Lipova','Liteni','Livada','Luduș','Lugoj','Lupeni','Măcin','Măgurele','Mangalia','Mărășești','Marghita','Medgidia','Mediaș','Miercurea Ciuc','Miercurea Nirajului','Miercurea Sibiului','Mihăilești','Milișăuți','Mioveni','Mizil','Moinești','Moldova Nouă','Moreni','Motru','Murfatlar','Murgeni','Nădlac','Năsăud','Năvodari','Negrești','Negrești-Oaș','Negru Vodă','Nehoiu','Novaci','Nucet','Ocna Mureș','Ocna Sibiului','Ocnele Mari','Odobești','Odorheiu Secuiesc','Oltenița','Onești','Oradea','Orăștie','Oravița','Orșova','Oțelu Roșu','Otopeni','Ovidiu','Panciu','Pâncota','Pantelimon','Pașcani','Pătârlagele','Pecica','Petrila','Petroșani','Piatra Neamț','Piatra-Olt','Pitești','Ploiești','Plopeni','Podu Iloaiei','Pogoanele','Popești-Leordeni','Potcoava','Predeal','Pucioasa','Răcari','Rădăuți','Râmnicu Sărat','Râmnicu Vâlcea','Râșnov','Recaș','Reghin','Reșița','Roman','Roșiorii de Vede','Rovinari','Roznov','Rupea','Săcele','Săcueni','Salcea','Săliște','Săliștea de Sus','Salonta','Sângeorgiu de Pădure','Sângeorz-Băi','Sânnicolau Mare','Sântana','Sărmașu','Satu Mare','Săveni','Scornicești','Sebeș','Sebiș','Segarcea','Seini','Sfântu Gheorghe','Sibiu','Sighetu Marmației','Sighișoara','Simeria','Șimleu Silvaniei','Sinaia','Siret','Slănic','Slănic-Moldova','Slatina','Slobozia','Solca','Șomcuta Mare','Sovata','Ștefănești, Argeș','Ștefănești, Botoșani','Ștei','Strehaia','Suceava','Sulina','Tălmaciu','Țăndărei','Târgoviște','Târgu Bujor','Târgu Cărbunești','Târgu Frumos','Târgu Jiu','Târgu Lăpuș','Târgu Mureș','Târgu Neamț','Târgu Ocna','Târgu Secuiesc','Târnăveni','Tășnad','Tăuții-Măgherăuș','Techirghiol','Tecuci','Teiuș','Țicleni','Timișoara','Tismana','Titu','Toplița','Topoloveni','Tulcea','Turceni','Turda','Turnu Măgurele','Ulmeni','Ungheni','Uricani','Urlați','Urziceni','Valea lui Mihai','Vălenii de Munte','Vânju Mare','Vașcău','Vaslui','Vatra Dornei','Vicovu de Sus','Victoria','Videle','Vișeu de Sus','Vlăhița','Voluntari','Vulcan','Zalău','Zărnești','Zimnicea','Zlatna');
  v_nume VARCHAR2(255);
  v_data1 date;
  v_data2 date;
  v_adresa1 int;
  v_adresa2 int;
    v_ora1 date;
    v_ora2 date;
    v_vagoane int;
    v_random int;
    v_increment int;
    v_increment_vagon int;
    v_increment_loc int;
    v_nr_locuri_ocupate int;
BEGIN
    v_increment:=1;
  DBMS_OUTPUT.PUT_LINE('Se insereaza datele..');
  -- Se insereaza Stațiile (3199 la numar)
  FOR v_i IN 1..319 LOOP
    v_nume := lista_statii(v_i);
    INSERT INTO statii VALUES(v_i, v_nume);
  END LOOP;

  -- Se insereaza 3000 de locomotive
    For v_i in 1..3000 loop
        insert into locomotiva values(v_i,TRUNC(DBMS_RANDOM.Value(1,319)));
    end loop;
  -- Se inserează 10000 de rapoarte de reparare
    For v_i in 1..10000 loop
        v_data1:= TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'),TO_CHAR(SYSDATE,'J'))),'J');
        v_data2:= TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(v_data1,'J'),TO_CHAR(SYSDATE,'J'))),'J');
        insert into mentenanta values(v_i,TRUNC(DBMS_RANDOM.Value(1,3000)),TRUNC(DBMS_RANDOM.Value(1,319)),v_data1,v_data2);
    end loop;

  -- Se insereaza Traseele
    For v_i in 1..10000 loop
        --statiile tinta
        v_adresa1:= TRUNC(DBMS_RANDOM.Value(1,319));
        v_adresa2:= TRUNC(DBMS_RANDOM.Value(1,319));
        if v_adresa2 = v_adresa1 then
        v_adresa1:= TRUNC(DBMS_RANDOM.Value(1,319));
        v_adresa2:= TRUNC(DBMS_RANDOM.Value(1,319));
        end if ;

        --orele de plecare/sosire
        v_ora1:= trunc(sysdate) + DBMS_RANDOM.Value(0,1);
        v_ora2:= trunc(sysdate) + DBMS_RANDOM.Value(v_ora1-trunc(v_ora1),1);

        insert into traseu values(v_i,v_ora1,v_ora2,v_adresa1,v_adresa2,0,TRUNC(DBMS_RANDOM.Value(1,3000)),TRUNC(DBMS_RANDOM.Value(1,6)),'Operational');
    end loop;

  --Biletele

        for v_i in 1..10000 loop
            select numar_vagoane into v_vagoane from traseu where id_traseu=v_i;
            v_data1:= TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'),TO_CHAR(SYSDATE,'J'))),'J');
                v_increment_loc:=11;
                v_increment_vagon:=1;
                v_nr_locuri_ocupate:= DBMS_RANDOM.VALUE(20,v_vagoane*100);
                for v_v in 1..v_nr_locuri_ocupate loop
                    insert into bilete values (v_increment,v_i,trunc(DBMS_RANDOM.VALUE(1,319)),v_increment_vagon,v_increment_loc,v_data1);
                    v_increment:= v_increment+1;
                    v_increment_loc:= v_increment_loc+1;
                    exit when v_increment_vagon= v_vagoane and v_increment_loc=111;
                    if (v_increment_loc=111) then
                        v_increment_vagon:= v_increment_vagon+1;
                        v_increment_loc:=11;
                    end if;
                end loop;
        end loop;
  DBMS_OUTPUT.PUT_LINE('Valorile au fost inserate.');
  end;