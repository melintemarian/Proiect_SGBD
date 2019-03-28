DROP TABLE trenuri CASCADE CONSTRAINTS
/
DROP TABLE statii CASCADE CONSTRAINTS
/
DROP TABLE bilete CASCADE CONSTRAINTS
/
DROP TABLE mentenanta CASCADE CONSTRAINTS
/

CREATE OR REPLACE TYPE listTrainStation AS VARRAY(20) OF Int
/

CREATE TABLE statii (
    id_statie INT NOT NULL PRIMARY KEY,
    Nume_Statie Varchar2(30) not null
)
/

CREATE TABLE bilete (
    id_bilet INT NOT NULL PRIMARY KEY,
    id_statie_cumparare int not null,
    id_statie_urcare int not null,
	id_statie_coborare int not null,
    id_tren INT not null,
    vagonul int not null,
    locul int not null check (locul between 11 and 111),
    data_bilet Date
)
/

Create Table mentenanta (
    id_reparare INT NOT NULL PRIMARY KEY,
    id_tren INT,
    id_statie INT,
    data_adaugare Date,
    data_eliberare Date
)
/

CREATE TABLE trenuri (
    id_tren INT NOT NULL PRIMARY KEY,
    ora_plecare date not null,
    ora_sosire date not null,
    id_statie_plecare int not null,
    id_statie_sosire int not null,
    intarziere date,
    id_statie_domiciliu Int not null,
    numar_vagoane INT check (numar_vagoane between 1 and 11),
    Stare_Tren Varchar2(20)
)
/
alter table "BILETE" add constraint fk_bilete_tren foreign key("ID_TREN") references "TRENURI"("ID_TREN");
alter table "BILETE" add constraint fk_bilete_cumparate foreign key("ID_STATIE_CUMPARARE") references "STATII"("ID_STATIE");
alter table "BILETE" add constraint fk_statie_urcare foreign key("ID_STATIE_URCARE") references "STATII"("ID_STATIE");
alter table "BILETE" add constraint fk_statie_coborare foreign key("ID_STATIE_COBORARE") references "STATII"("ID_STATIE");

alter table "MENTENANTA" add constraint fk_reparare_tren foreign key("ID_TREN") references "TRENURI"("ID_TREN");
alter table "MENTENANTA" add constraint fk_locatie_reparare_tren foreign key("ID_STATIE") references "STATII"("ID_STATIE");

alter table "TRENURI" add constraint fk_statie_plecare foreign key("ID_STATIE_PLECARE") references "STATII"("ID_STATIE");
alter table "TRENURI" add constraint fk_statie_sosire foreign key("ID_STATIE_SOSIRE") references "STATII"("ID_STATIE");
alter table "TRENURI" add constraint fk_statie_domiciliu foreign key("ID_STATIE_DOMICILIU") references "STATII"("ID_STATIE");

alter table Bilete add constraint ck_equal_locatii_cumparare check (id_statie_urcare <> id_statie_coborare);
alter table Trenuri add constraint ck_equal_locatii_tren check (id_statie_plecare <> id_statie_sosire);
alter table BILETE add constraint un unique("ID_TREN","VAGONUL","LOCUL","DATA_BILET");

SET SERVEROUTPUT ON;

DECLARE
  TYPE varr IS VARRAY(1000) OF VARCHAR2(255);
  
  lista_statii varr := varr('Abrud', 'Adjud', 'Agnita', 'Aiud', 'Alba Iulia', 'Ale?d', 'Alexandria', 'Amara', 'Anina', 'Aninoasa', 'Arad', 'Ardud', 'Avrig', 'Azuga', 'Babadag', 'B?beni', 'Bac?u', 'Baia de Aram?', 'Baia Arie?', 'Baia Mare', 'Baia Sprie', 'B?icoi', 'B?ile Govora', 'B?ile Herculane', 'B?ile Ol?ne?ti', 'B?ile Tu?nad', 'B?ile?ti', 'B?lan', 'B?lce?ti', 'Bal?', 'Baraolt', 'Bârlad', 'Bechet', 'Beclean', 'Beiu?', 'Berbe?ti', 'Bere?ti', 'Bicaz', 'Bistri?a', 'Blaj', 'Boc?a', 'Bolde?ti-Sc?eni', 'Bolintin-Vale', 'Bor?a', 'Borsec', 'Boto?ani', 'Brad', 'Bragadiru', 'Br?ila', 'Bra?ov', 'Breaza', 'Brezoi', 'Bro?teni', 'Bucecea', 'Bucure?ti', 'Bude?ti', 'Buftea', 'Buhu?i', 'Bumbe?ti-Jiu', 'Bu?teni', 'Buz?u', 'Buzia?', 'Cajvana', 'Calafat', 'C?lan', 'C?l?ra?i', 'C?lim?ne?ti', 'Câmpeni', 'Câmpia Turzii', 'Câmpina', 'Câmpulung Moldovenesc', 'Câmpulung', 'Caracal', 'Caransebe?', 'Carei', 'Cavnic', 'C?z?ne?ti', 'Cehu Silvaniei', 'Cernavod?', 'Chi?ineu-Cri?', 'Chitila', 'Ciacova', 'Cisn?die', 'Cluj-Napoca', 'Codlea', 'Com?ne?ti', 'Comarnic', 'Constan?a', 'Cop?a Mic?', 'Corabia', 'Coste?ti', 'Covasna', 'Craiova', 'Cristuru Secuiesc', 'Cugir', 'Curtea Arge?', 'Curtici', 'D?buleni', 'Darabani', 'D?rm?ne?ti', 'Dej', 'Deta', 'Deva', 'Dolhasca', 'Dorohoi', 'Dr?g?ne?ti-Olt', 'Dr?g??ani', 'Dragomire?ti', 'Drobeta-Turnu Severin', 'Dumbr?veni', 'Eforie', 'F?g?ra?', 'F?get', 'F?lticeni', 'F?urei', 'Fete?ti', 'Fieni', 'Fierbin?i-Târg', 'Filia?i', 'Fl?mânzi', 'Foc?ani', 'Frasin', 'Fundulea', 'G?e?ti', 'Gala?i', 'G?taia', 'Geoagiu', 'Gheorgheni', 'Gherla', 'Ghimbav', 'Giurgiu', 'Gura Humorului', 'Hârl?u', 'Hâr?ova', 'Ha?eg', 'Horezu', 'Huedin', 'Hunedoara', 'Hu?i', 'Ianca', 'Ia?i', 'Iernut', 'Ineu', 'Însur??ei', 'Întorsura Buz?ului', 'Isaccea', 'Jibou', 'Jimbolia', 'Lehliu Gar?', 'Lipova', 'Liteni', 'Livada', 'Ludu?', 'Lugoj', 'Lupeni', 'M?cin', 'M?gurele', 'Mangalia', 'M?r??e?ti', 'Marghita', 'Medgidia', 'Media?', 'Miercurea Ciuc', 'Miercurea Nirajului', 'Miercurea Sibiului', 'Mih?ile?ti', 'Mili??u?i', 'Mioveni', 'Mizil', 'Moine?ti', 'Moldova Nou?', 'Moreni', 'Motru', 'Murfatlar', 'Murgeni', 'N?dlac', 'N?s?ud', 'N?vodari', 'Negre?ti', 'Negre?ti-Oa?', 'Negru Vod?', 'Nehoiu', 'Novaci', 'Nucet', 'Ocna Mure?', 'Ocna Sibiului', 'Ocnele Mari', 'Odobe?ti', 'Odorheiu Secuiesc', 'Olteni?a', 'One?ti', 'Oradea', 'Or??tie', 'Oravi?a', 'Or?ova', 'O?elu Ro?u', 'Otopeni', 'Ovidiu', 'Panciu', 'Pâncota', 'Pantelimon', 'Pa?cani', 'P?târlagele', 'Pecica', 'Petrila', 'Petro?ani', 'Piatra Neam?', 'Piatra-Olt', 'Pite?ti', 'Ploie?ti', 'Plopeni', 'Podu Iloaiei', 'Pogoanele', 'Pope?ti-Leordeni', 'Potcoava', 'Predeal', 'Pucioasa', 'R?cari', 'R?d?u?i', 'Râmnicu S?rat', 'Râmnicu Vâlcea', 'Râ?nov', 'Reca?', 'Reghin', 'Re?i?a', 'Roman', 'Ro?iorii Vede', 'Rovinari', 'Roznov', 'Rupea', 'S?cele', 'S?cueni', 'Salcea', 'S?li?te', 'S?li?tea Sus', 'Salonta', 'Sângeorgiu P?dure', 'Sângeorz-B?i', 'Sânnicolau Mare', 'Sântana', 'S?rma?u', 'Satu Mare', 'S?veni', 'Scornice?ti', 'Sebe?', 'Sebi?', 'Segarcea', 'Seini', 'Sfântu Gheorghe', 'Sibiu', 'Sighetu Marma?iei', 'Sighi?oara', 'Simeria', '?imleu Silvaniei', 'Sinaia', 'Siret', 'Sl?nic', 'Sl?nic-Moldova', 'Slatina', 'Slobozia', 'Solca', '?omcuta Mare', 'Sovata', '?tef?ne?ti, Arge?', '?tef?ne?ti, Boto?ani', '?tei', 'Strehaia', 'Suceava', 'Sulina', 'T?lmaciu', '??nd?rei', 'Târgovi?te', 'Târgu Bujor', 'Târgu C?rbune?ti', 'Târgu Frumos', 'Târgu Jiu', 'Târgu L?pu?', 'Târgu Mure?', 'Târgu Neam?', 'Târgu Ocna', 'Târgu Secuiesc', 'Târn?veni', 'T??nad', 'T?u?ii-M?gher?u?', 'Techirghiol', 'Tecuci', 'Teiu?', '?icleni', 'Timi?oara', 'Tismana', 'Titu', 'Topli?a', 'Topoloveni', 'Tulcea', 'Turceni', 'Turda', 'Turnu M?gurele', 'Ulmeni', 'Ungheni', 'Uricani', 'Urla?i', 'Urziceni', 'Valea lui Mihai', 'V?lenii Munte', 'Vânju Mare', 'Va?c?u', 'Vaslui', 'Vatra Dornei', 'Vicovu Sus', 'Victoria', 'Videle', 'Vi?eu Sus', 'Vl?hi?a', 'Voluntari', 'Vulcan', 'Zal?u', 'Z?rne?ti', 'Zimnicea', 'Zlatna');
  lista_stari_tren varr := varr('Functional', 'Avariat', 'Nefunctional', 'Necunoscut');
  
  --v_tren_id INT;
  --v_nume_tren VARCHAR2(8); -- Variabile care pot fi implementate ca obiectiv secundar, descrierea mai jos
  v_ora_plecare DATE;
  v_ora_sosire DATE;
  v_intarziere DATE;
  v_numar_vagoane INT;
  v_stare_tren VARCHAR2(50);
  v_nume_statie VARCHAR2(255);
  v_data_bilet DATE;
  v_data_adaugare DATE;
  v_data_eliberare DATE;
  v_statie_plecare INT;
  v_statie_sosire INT;
  v_statie_domiciliu INT;
  
BEGIN
  
  DBMS_OUTPUT.PUT_LINE('Se insereaza statiile..');
  
  FOR v_i IN 1..319 LOOP
    v_nume_statie := lista_statii(v_i);
    
    INSERT INTO statii VALUES(v_i, v_nume_statie);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Statiile au fost inserate.');

  DBMS_OUTPUT.PUT_LINE('Se insereaza trenurile..');
  
  FOR v_i IN 1..1300 LOOP --Numarul estimat de trenuri puse in circulatie zilnic
  
    /* -- Un atribut aditional pentru tabela 'trenuri': Nume_Tren. Poate fi implementat ca obiectiv secundar: in realitate, numele trenurilor este un intreg cuprins intre 200 si 15000, prefixat corespunzator fie de 'R ', fie de 'IR '
    LOOP
      v_tren_id := TRUNC(DBMS_RANDOM.VALUE(200, 15000));
      EXIT WHEN v_tren_id < 500 OR v_tren_id > 599; -- trenurile avand codul intre 500 si 600 reprezentau o clasa speciala de trenuri, care au fost scoase din functiune
    END LOOP;
    
    IF(v_tren_id >= 2000 AND v_tren_id <= 9999) THEN -- acestea sunt trenurile Regio
      v_nume_tren := 'R ' || TO_CHAR(v_tren_id);
    ELSE
      v_nume_tren := 'IR ' || TO_CHAR(v_tren_id); -- acestea sunt trenurile InterRegio
    END IF;
    */
    
    v_ora_plecare := (SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0,1000)));
    v_ora_sosire := (SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 1000)));
    
    v_intarziere := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 1000));
    
    v_numar_vagoane := TRUNC(DBMS_RANDOM.VALUE(1, 12));
    
    v_stare_tren := lista_stari_tren(TRUNC(DBMS_RANDOM.VALUE(0, lista_stari_tren.count)) + 1);
    
    LOOP
      SELECT * INTO v_statie_plecare FROM (SELECT id_statie FROM statii ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1;
      SELECT * INTO v_statie_sosire FROM (SELECT id_statie FROM statii ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1;
      EXIT WHEN v_statie_plecare <> v_statie_sosire;
    END LOOP;
    
    SELECT * INTO v_statie_domiciliu FROM (SELECT id_statie FROM statii ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1;
    
    INSERT INTO trenuri VALUES(v_i, v_ora_plecare, v_ora_sosire, v_statie_plecare, v_statie_sosire, v_intarziere, v_statie_domiciliu, v_numar_vagoane, v_stare_tren);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Trenurile au fost inserate.');
END;
  
  /*
  DBMS_OUTPUT.PUT_LINE('Se insereaza biletele..');
  
  FOR v_i IN 1..10000 LOOP
    
    v_data_bilet := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 1000));
    
    INSERT INTO bilete VALUES(v_i, DBMS_RANDOM.VALUE(1, 1001), DBMS_RANDOM.VALUE(1, 320), DBMS_RANDOM.VALUE(1, 320), DBMS_RANDOM.VALUE(1, 1301), DBMS_RANDOM.VALUE(1, 12), DBMS_RANDOM.VALUE(11, 112), v_data_bilet);
  END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Biletele au fost inserate.');
  
    DBMS_OUTPUT.PUT_LINE('Se insereaza procesele de mentenanta..');
    
    FOR v_i IN 1..1000 LOOP
    
      v_data_adaugare := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 1000));
      v_data_eliberare := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 1000));
      
      INSERT INTO mentenanta VALUES(v_i, DBMS_RANDOM.VALUE(1, 1301), DBMS_RANDOM.VALUE(1, 320), v_data_adaugare, v_data_eliberare);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Procesele de mentenanta au fost inserate.');
END;
*/