#tworzenie nowej bazy danych
CREATE DATABASE baza_umow;
USE baza_umow;
#tworzenie tabeli FIRM
CREATE TABLE firmy (
    id_firmy INT(5) AUTO_INCREMENT,
    nazwa_firmy VARCHAR(45) UNIQUE NOT NULL,
    NIP VARCHAR(10) UNIQUE NOT NULL,
    REGON VARCHAR(9) UNIQUE NOT NULL,
    telefon VARCHAR(9),
    email VARCHAR(45),
    PRIMARY KEY (id_firmy)
);
#tworzenie tabeli RÓL
CREATE TABLE role (
    id_roli INT(5) AUTO_INCREMENT,
    rola VARCHAR(45) UNIQUE NOT NULL,
    PRIMARY KEY (id_roli)
);
#tworzenie tabeli użytkowników
CREATE TABLE uzytkownicy (
    id_uzytkownika INT(5) AUTO_INCREMENT,
    id_firmy INT(5) NOT NULL,
    imie VARCHAR(45) NOT NULL,
    nazwisko VARCHAR(45) NOT NULL,
    PESEL VARCHAR(11) NOT NULL UNIQUE,
    id_roli INT(5),
    telefon VARCHAR(45),
    email VARCHAR(45),
    PRIMARY KEY (id_uzytkownika),
    FOREIGN KEY (id_firmy)
        REFERENCES firmy (id_firmy),
    FOREIGN KEY (id_roli)
        REFERENCES role (id_roli)
);
#tworzenie tabeli z LOGINAMI
CREATE TABLE loginy (
    id_loginu INT(5) AUTO_INCREMENT,
    id_uzytkownika INT(5) UNIQUE NOT NULL,
    login VARCHAR(10) UNIQUE,
    haslo VARCHAR(45),
    PRIMARY KEY (id_loginu),
    FOREIGN KEY (id_uzytkownika)
        REFERENCES uzytkownicy (id_uzytkownika)
);
#tworzenie tabeli PRODUKTÓW
CREATE TABLE produkty (
    id_produktu INT(5) AUTO_INCREMENT,
    nazwa_produktu VARCHAR(25) UNIQUE NOT NULL,
    typ_produktu VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_produktu)
);
#tworzenie tabeli z UMOWAMI
CREATE TABLE umowy (
    id_umowy INT(5) AUTO_INCREMENT,
    id_produktu INT(5) NOT NULL,
    kwota INT(10) NOT NULL,
    data_sprzedazy DATE NOT NULL,
    PESEL_klienta VARCHAR(11) NOT NULL,
    imie_klienta VARCHAR(30) NOT NULL,
    nazwisko_klienta VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_umowy),
    FOREIGN KEY (id_produktu)
        REFERENCES produkty (id_produktu)
);
#tworzenie tabeli z STATUSÓW
CREATE TABLE statusy (
    id_statusu INT(5) AUTO_INCREMENT,
    nazwa_statusu VARCHAR(30) UNIQUE NOT NULL,
    PRIMARY KEY (id_statusu)
);
#tworzenie tabeli przypisującej umowy do użytkowników
CREATE TABLE umowy_uzytkownicy (
    id INT AUTO_INCREMENT,
    id_uzytkownika INT(5),
    id_umowy INT(5) NOT NULL,
    stawka FLOAT(2) NOT NULL DEFAULT 0,
    prowizja FLOAT(2) DEFAULT 0,
    id_statusu INT(5) DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (id_uzytkownika)
        REFERENCES uzytkownicy (id_uzytkownika),
    FOREIGN KEY (id_umowy)
        REFERENCES umowy (id_umowy),
    FOREIGN KEY (id_statusu)
        REFERENCES statusy (id_statusu)
);
#wyzwalacz dodający AGENTOWI login
delimiter $$
CREATE TRIGGER Tdod_login
AFTER INSERT ON uzytkownicy 
FOR EACH ROW
BEGIN
insert into loginy (id_uzytkownika, login) values 
(new.id_uzytkownika, (concat(left(new.imie,3),left(new.nazwisko,3),lpad(new.id_uzytkownika,4,0))));
end; $$ delimiter ;

#tworzenie widoku listy uzytkownikow z przypisaną firmą i rolą
create view Vlista_uzytkownikow as
select 
uz.id_uzytkownika AS 'ID uzytkownika',
uz.imie AS 'Imię',
uz.nazwisko AS 'Nazwisko',
r.rola as 'Rola',
f.id_firmy as 'ID firmy',
f.nazwa_firmy as 'Nazwa firmy'
from uzytkownicy as uz
join role as r on uz.id_roli=r.id_roli
join firmy as f on f.id_firmy=uz.id_firmy
order by f.id_firmy, r.id_roli;

select * from Vlista_uzytkownikow;
#drop view Vlista_uzytkownikow;

#tworzenie widoku listy wszystkich umow z przypisana stawka i agentem
create view Vraport_umow as
select 
p.nazwa_produktu as 'Produkt',
uz_um.id_umowy as 'ID umowy',
um.data_sprzedazy as 'Data sprzedazy',
um.PESEL_klienta as 'PESEL klienta',
um.imie_klienta as 'Imie klienta',
um.nazwisko_klienta as 'Nazwisko klienta',
um.kwota as 'Kwota',
uz_um.stawka as 'Stawka',
uz_um.prowizja as 'Prowizja',
s.nazwa_statusu as 'Status umowy',
f.id_firmy as 'ID firmy',
f.nazwa_firmy as 'Nazwa firmy',
uz.id_uzytkownika as 'ID użytkownika',
uz.imie as 'Imię użytkownika',
uz.nazwisko as 'Nazwisko użytkownika'
from umowy_uzytkownicy as uz_um
left join umowy as um on um.id_umowy=uz_um.id_umowy
left join uzytkownicy as uz on uz.id_uzytkownika=uz_um.id_uzytkownika
left join firmy as f on f.id_firmy=uz.id_firmy
left join produkty as p on p.id_produktu=um.id_produktu
left join statusy as s on s.id_statusu=uz_um.id_statusu
order by um.data_sprzedazy;

select * from Vraport_umow;
#drop view Vlista_umow;

#lista pracowników centrali
create view Vlista_centrala as
select
u.imie as 'Imię',
u.nazwisko as 'Nazwisko',
r.rola as 'Stanowisko'
from uzytkownicy as u
left join role as r on r.id_roli=u.id_roli
where u.id_firmy=1;

select * from Vlista_centrala;
#drop view Vlista_centrala;

#wyswietlanie umow do akceptacji
create view Vdo_rozliczenia as
select
umuz.id_umowy as 'Numer umowy',
p.nazwa_produktu as 'Produkt',
um.data_sprzedazy as 'Data sprzedaży',
um.PESEL_klienta as 'PESEL',
um.kwota as 'Wolumen umowy',
umuz.stawka as 'Stawka w %',
umuz.prowizja as 'Prowizja'
from umowy_uzytkownicy as umuz
left join umowy as um on umuz.id_umowy=um.id_umowy
left join produkty as p on p.id_produktu=um.id_produktu
where umuz.id_statusu=1;

select * from Vdo_rozliczenia;
#drop view Vdo_rozliczenia; 

