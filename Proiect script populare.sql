
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

SET SERVEROUTPUT ON;

DECLARE
  TYPE varr IS VARRAY(1000) OF VARCHAR2(255);
  
  lista_statii varr := varr('Abrud','Adjud','Agnita','Aiud','Alba Iulia','Ale?d','Alexandria','Amara','Anina','Aninoasa','Arad','Ardud','Avrig','Azuga','Babadag','B?beni','Bac?u','Baia de Aram?','Baia de Arie?','Baia Mare','Baia Sprie', 'B?icoi','B?ile Govora','B?ile Herculane','B?ile Ol?ne?ti','B?ile Tu?nad','B?ile?ti','B?lan','B?lce?ti','Bal?','Baraolt','Bârlad','Bechet','Beclean','Beiu?','Berbe?ti','Bere?ti','Bicaz','Bistri?a','Blaj','Boc?a', 'Bolde?ti-Sc?eni','Bolintin-Vale','Bor?a','Borsec','Boto?ani','Brad','Bragadiru','Br?ila','Bra?ov','Breaza','Brezoi','Bro?teni','Bucecea','Bucure?ti','Bude?ti','Buftea','Buhu?i','Bumbe?ti-Jiu','Bu?teni','Buz?u', 'Buzia?','Cajvana','Calafat','C?lan','C?l?ra?i','C?lim?ne?ti','Câmpeni','Câmpia Turzii','Câmpina','Câmpulung Moldovenesc','Câmpulung','Caracal','Caransebe?','Carei','Cavnic','C?z?ne?ti','Cehu Silvaniei','Cernavod?','Chi?ineu-Cri?', 'Chitila','Ciacova','Cisn?die','Cluj-Napoca','Codlea','Com?ne?ti','Comarnic','Constan?a','Cop?a Mic?','Corabia','Coste?ti','Covasna','Craiova','Cristuru Secuiesc','Cugir','Curtea de Arge?','Curtici', 'D?buleni','Darabani','D?rm?ne?ti','Dej','Deta','Deva','Dolhasca','Dorohoi','Dr?g?ne?ti-Olt','Dr?g??ani','Dragomire?ti','Drobeta-Turnu Severin', 'Dumbr?veni', 'Eforie', 'F?g?ra?', 'F?get', 'F?lticeni', 'F?urei', 'Fete?ti', 'Fieni', 'Fierbin?i-Târg', 'Filia?i', 'Fl?mânzi', 'Foc?ani', 'Frasin', 'Fundulea', 'G?e?ti', 'Gala?i', 'G?taia', 'Geoagiu', 'Gheorgheni', 'Gherla', 'Ghimbav', 'Giurgiu', 'Gura Humorului', 'Hârl?u', 'Hâr?ova', 'Ha?eg', 'Horezu', 'Huedin', 'Hunedoara', 'Hu?i', 'Ianca', 'Ia?i', 'Iernut', 'Ineu', 'Însur??ei', 'Întorsura Buz?ului', 'Isaccea', 'Jibou', 'Jimbolia', 'Lehliu Gar?', 'Lipova', 'Liteni', 'Livada', 'Ludu?', 'Lugoj', 'Lupeni', 'M?cin', 'M?gurele', 'Mangalia', 'M?r??e?ti', 'Marghita', 'Medgidia', 'Media?', 'Miercurea Ciuc', 'Miercurea Nirajului', 'Miercurea Sibiului', 'Mih?ile?ti', 'Mili??u?i', 'Mioveni', 'Mizil', 'Moine?ti', 'Moldova Nou?', 'Moreni', 'Motru', 'Murfatlar', 'Murgeni', 'N?dlac', 'N?s?ud', 'N?vodari', 'Negre?ti', 'Negre?ti-Oa?', 'Negru Vod?', 'Nehoiu', 'Novaci', 'Nucet', 'Ocna Mure?', 'Ocna Sibiului', 'Ocnele Mari', 'Odobe?ti', 'Odorheiu Secuiesc', 'Olteni?a', 'One?ti', 'Oradea', 'Or??tie', 'Oravi?a', 'Or?ova', 'O?elu Ro?u', 'Otopeni', 'Ovidiu', 'Panciu', 'Pâncota', 'Pantelimon', 'Pa?cani', 'P?târlagele', 'Pecica', 'Petrila', 'Petro?ani', 'Piatra Neam?', 'Piatra-Olt', 'Pite?ti', 'Ploie?ti', 'Plopeni', 'Podu Iloaiei', 'Pogoanele', 'Pope?ti-Leordeni', 'Potcoava', 'Predeal', 'Pucioasa', 'R?cari', 'R?d?u?i', 'Râmnicu S?rat', 'Râmnicu Vâlcea', 'Râ?nov', 'Reca?', 'Reghin', 'Re?i?a', 'Roman', 'Ro?iorii de Vede', 'Rovinari', 'Roznov', 'Rupea', 'S?cele', 'S?cueni', 'Salcea', 'S?li?te', 'S?li?tea de Sus', 'Salonta', 'Sângeorgiu de P?dure', 'Sângeorz-B?i', 'Sânnicolau Mare', 'Sântana', 'S?rma?u', 'Satu Mare', 'S?veni', 'Scornice?ti', 'Sebe?', 'Sebi?', 'Segarcea', 'Seini', 'Sfântu Gheorghe', 'Sibiu', 'Sighetu Marma?iei', 'Sighi?oara', 'Simeria', '?imleu Silvaniei', 'Sinaia', 'Siret', 'Sl?nic', 'Sl?nic-Moldova', 'Slatina', 'Slobozia', 'Solca', '?omcuta Mare', 'Sovata', '?tef?ne?ti, Arge?', '?tef?ne?ti, Boto?ani', '?tei', 'Strehaia', 'Suceava', 'Sulina', 'T?lmaciu', '??nd?rei', 'Târgovi?te','Târgu Bujor','Târgu C?rbune?ti','Târgu Frumos','Târgu Jiu','Târgu L?pu?','Târgu Mure?','Târgu Neam?','Târgu Ocna','Târgu Secuiesc','Târn?veni','T??nad','T?u?ii-M?gher?u?','Techirghiol','Tecuci','Teiu?','?icleni','Timi?oara','Tismana','Titu','Topli?a','Topoloveni','Tulcea','Turceni','Turda','Turnu M?gurele','Ulmeni','Ungheni','Uricani','Urla?i','Urziceni','Valea lui Mihai','V?lenii de Munte','Vânju Mare','Va?c?u','Vaslui','Vatra Dornei','Vicovu de Sus','Victoria','Videle','Vi?eu de Sus','Vl?hi?a','Voluntari','Vulcan','Zal?u','Z?rne?ti','Zimnicea','Zlatna');
  v_nume VARCHAR2(255);
  
BEGIN
  DBMS_OUTPUT.PUT_LINE('Se insereaza datele..');
  FOR v_i IN 1..1000 LOOP
    v_nume := lista_statii(TRUNC(DBMS_RANDOM.VALUE(0, lista_statii.count)) + 1);
    
    INSERT INTO statii VALUES(v_i, v_nume);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Valorile au fost inserate.');
  
END;