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
    Nume_Statie Varchar2(20) not null
)
/

CREATE TABLE bilete (
    id_bilet INT NOT NULL PRIMARY KEY,
    id_statie_cumparare int not null,
    id_statie_urcare int not null,
	id_statie_coborare int not null,
    id_tren INT not null,
    vagonul int not null,
    locul int not null check (locul between 11 and 111)
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