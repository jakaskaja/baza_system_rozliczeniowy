#dodawanie danych FIRM
INSERT INTO firmy VALUES (1,'CENTRALA','1010101010','999999999','111111111','centrala@centrala.pl');
INSERT INTO firmy VALUES (2,'Finanse i kredyty STOKROTKA','6912550839','953238809','877388319','finansekredyty@gmail.com');
INSERT INTO firmy VALUES (3,'Twój doradca','8934815269','759937412','789472612','twojdoradca@gmail.com');
INSERT INTO firmy VALUES (4,'Kredyt od reki','6856127949','674538269','328620970','kredytodreki@onet.pl');
INSERT INTO firmy VALUES (5,'ABC Finanse','5758029174','812043653','228211740','abcfinanse@o2.pl');
SELECT * FROM firmy;

#dodawanie danych RÓL
INSERT INTO role VALUES(1,'Admin');
INSERT INTO role VALUES(2,'Wlasciciel');
INSERT INTO role VALUES(3,'Agent');
INSERT INTO role VALUES(4,'Akredytacja');
INSERT INTO role VALUES(5,'Rozliczenia');
INSERT INTO role VALUES(6,'Podglad');
SELECT * FROM role;

#dodawanie danych UZYTKOWNIKOW
INSERT INTO uzytkownicy VALUES(1,2,'Antonina','Piatek','78040200205',2,'601507921','apiatek@o2.pl');
INSERT INTO uzytkownicy VALUES(2,3,'Sebastian','Jablonski','95082419170',3,'739293822','sebjab@gmail.com');
INSERT INTO uzytkownicy VALUES(3,3,'Alicja','Wisniewska','93052615807',2,'734227564','alicjawis@o2.pl');
INSERT INTO uzytkownicy VALUES(4,4,'Zofia','Mazur','96120902546',2,'666868072','zofiamazur@gmail.com');
INSERT INTO uzytkownicy VALUES(5,3,'Franciszek','Wroblewski','64080204510',3,'607006692','fworblewski@onet.pl');
INSERT INTO uzytkownicy VALUES(6,5,'Oliwia','Bak','89050600507',2,'738059581','oliwiab@wp.pl');
INSERT INTO uzytkownicy VALUES(7,5,'Bartosz','Witkowski','78050513531',3,'734293143','witbar@wp.pl');
INSERT INTO uzytkownicy VALUES(8,2,'Krzysztof','Malek','82011706773',3,'699094121','malek@o2.pl');
INSERT INTO uzytkownicy VALUES(9,4,'Daniel','Wrobel','58091502396',3,'794149251','danielw@o2.pl');
INSERT INTO uzytkownicy VALUES(10,3,'Kamila','Matusiak','79062201067',3,'783286877','kamila.matusiak@tlen.pl');
INSERT INTO uzytkownicy VALUES(11,1,'Jan','Chwalek','78021312716',1,'222000005','j_chwalek@centrala.pl');
INSERT INTO uzytkownicy VALUES(12,1,'Kamila','Grzadziel','85040118368',4,'222000001','k_grzadziel@centrala.pl');
INSERT INTO uzytkownicy VALUES(13,1,'Jakub','Podlaski','83012508999',4,'222000002','j_podlaski@centrala.pl');
INSERT INTO uzytkownicy VALUES(14,1,'Wiktoria','Spyra','82062714921',5,'222000003','w_spyra@centrala.pl');
INSERT INTO uzytkownicy VALUES(15,1,'Beniamin','Zalas','80111908471',6,'222000004','b_zalas@centrala.pl');
SELECT * FROM uzytkownicy;
SELECT * FROM loginy;

#dodawanie danych PRODUKTÓW
INSERT INTO produkty VALUES(1,'Raiffeisen Polbank','bank');
INSERT INTO produkty VALUES(2,'Provident','pozabank');
INSERT INTO produkty VALUES(3,'Getin Bank','bank');
INSERT INTO produkty VALUES(4,'Vivus','pozabank');
INSERT INTO produkty VALUES(5,'Alior Bank','bank');
SELECT * FROM produkty;

#dodawanie danych do tabeli UMOWY
INSERT INTO umowy VALUES(1,1,10000,'2017-02-12','59092700219','Kamil','Janicki');
INSERT INTO umowy VALUES(2,5,5000,'2017-02-25','78051707849','Antonina','Urban');
INSERT INTO umowy VALUES(3,3,20000,'2017-03-01','84111212477','Jaroslaw','Wierzbicki');
INSERT INTO umowy VALUES(4,2,100000,'2017-03-15','77102703777','Kamil','Owczarek');
INSERT INTO umowy VALUES(5,1,10000,'2017-03-15','65080107834','Nikodem','Zak');
INSERT INTO umowy VALUES(6,1,20000,'2017-03-18','60092403033','Jaroslaw','Wawrzyniak');
INSERT INTO umowy VALUES(7,5,200000,'2017-04-10','58030916068','Julia','Zieba');
INSERT INTO umowy VALUES(8,2,20000,'2017-04-10','79012119684','Zuzanna','Dudek');
INSERT INTO umowy VALUES(9,4,10000,'2017-04-11','83051318139','Wojciech','Laskowski');
INSERT INTO umowy VALUES(10,2,30000,'2017-04-12','81111610748','Patrycja','Luczak');
INSERT INTO umowy VALUES(11,2,10000,'2017-05-12','91121409955','Igor','Piotrowski');
INSERT INTO umowy VALUES(12,2,10000,'2017-06-08','74112714870','Radoslaw','Tomaszewski');
INSERT INTO umowy VALUES(13,5,20000,'2017-06-08','98062109632','Milosz','Sikorski');
INSERT INTO umowy VALUES(14,4,10000,'2017-06-08','58033013595','Borys','Nowak');
INSERT INTO umowy VALUES(15,2,25000,'2017-06-13','77071914367','Julia','Nowak');
INSERT INTO umowy VALUES(16,3,15000,'2017-06-13','75012506787','Maja','Duda');
INSERT INTO umowy VALUES(17,1,51000,'2017-06-13','81050401041','Wiktoria','Kaminska');
INSERT INTO umowy VALUES(18,4,20000,'2017-06-15','70091606078','Leon','Krol');
SELECT * FROM UMOWY;

#dodawanie danych do tabeli STATUSY
INSERT INTO statusy VALUES(1,'wprowadzona');
INSERT INTO statusy VALUES(2,'zatwierdzona');
INSERT INTO statusy VALUES(3,'rozliczona');
SELECT * FROM statusy;

#dodawanie danych do tabeli UMOWY_UZYTKOWNICY
INSERT INTO umowy_uzytkownicy VALUES(1,2,1,8,800,3);
INSERT INTO umowy_uzytkownicy VALUES(2,1,2,7.5,375,2);
INSERT INTO umowy_uzytkownicy VALUES(3,6,3,11,2200,3);
INSERT INTO umowy_uzytkownicy VALUES(4,3,4,9.5,9500,2);
INSERT INTO umowy_uzytkownicy VALUES(5,4,5,8,800,3);
INSERT INTO umowy_uzytkownicy VALUES(6,3,6,8,1600,3);
INSERT INTO umowy_uzytkownicy VALUES(7,7,7,7.5,15000,3);
INSERT INTO umowy_uzytkownicy VALUES(8,2,8,9.5,1900,3);
INSERT INTO umowy_uzytkownicy VALUES(9,5,9,8.75,875,2);
INSERT INTO umowy_uzytkownicy VALUES(10,5,10,9.5,2850,2);
INSERT INTO umowy_uzytkownicy VALUES(11,5,11,9.5,950,2);
INSERT INTO umowy_uzytkownicy VALUES(12,1,12,9.5,950,2);
INSERT INTO umowy_uzytkownicy VALUES(13,10,13,7.5,1500,2);
INSERT INTO umowy_uzytkownicy VALUES(14,9,14,8.75,875,1);
INSERT INTO umowy_uzytkownicy VALUES(15,9,15,9.5,2375,1);
INSERT INTO umowy_uzytkownicy VALUES(16,10,16,11,1650,1);
INSERT INTO umowy_uzytkownicy VALUES(17,2,17,8,4080,1);
INSERT INTO umowy_uzytkownicy VALUES(18,4,18,8.75,1750,1);
SELECT * FROM umowy_uzytkownicy;
