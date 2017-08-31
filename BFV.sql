#tworzę bazę danych: biblioteka filmów video
create database bfv1;
use bfv1;
#pierwsza tabela zawierająca listę klientów wypożyczających filmy
CREATE TABLE Widz (
    id_widz INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(15) NOT NULL,
    nazwisko VARCHAR(25) NOT NULL,
    miasto TEXT NOT NULL,
    wojewodztwo TEXT NOT NULL,
    email TEXT NOT NULL,
    login VARCHAR(10) NOT NULL,
    haslo VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_widz)
);
#druga tabela zawierająca informacje o zamówionych, wypożyczonych, oddanych filmach
CREATE TABLE zamowienie (
    id_zamowienie INT auto_increment,
    id_widz INT NOT NULL,
    id_film INT NOT NULL,
    data_zamowienia DATE NOT NULL,
    data_odbioru DATE NULL,
    data_zwrotu DATE NULL,
    PRIMARY KEY (id_zamowienie),
    FOREIGN KEY (id_widz)
        REFERENCES Widz (id_widz),
    FOREIGN KEY (id_film)
        REFERENCES film (id_film)
);
#drop table zamowienie;
#trzecia tabela zawierająca kategorie filmów
CREATE TABLE kategoria (
    id_kategoria INT NOT NULL,
    nazwa VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_kategoria)
);
#czwarta tabela zawiera filmy dostępne w bazie danych
CREATE TABLE film (
    id_film INT auto_increment,
    id_kategoria INT NOT NULL,
    numer VARCHAR(6) NOT NULL,
    tytuł VARCHAR(150) NOT NULL,
    rezyser VARCHAR(50) NOT NULL,
    czas_trwania INT NOT NULL,
    rok_premiery INT(4) NOT NULL,
    opis TEXT NULL,
    PRIMARY KEY (id_film),
    FOREIGN KEY (id_kategoria)
        REFERENCES kategoria (id_kategoria)
);
show tables;
#piąta tabela - administrator biblioteki
create table admin (
id_admin int auto_increment,
login varchar(10) not null,
haslo varchar(10) not null,
primary key (id_admin)
);
#Dodaję rekordy do tabeli kategoria(gatunek) filmu
insert into kategoria values(1, 'Komedia');
insert into kategoria values(2, 'Akcja');
insert into kategoria values(3, 'Horror');
insert into kategoria values(4, 'Kryminał');
insert into kategoria values(5, 'Animacja');
insert into kategoria values(6, 'Przygodowy');
insert into kategoria values(7, 'Dramat');
insert into kategoria values(8, 'Biograficzny');
insert into kategoria values(9, 'Wojenny');
insert into kategoria values(10, 'Romans');
#Dodaję rekordy do tabeli widz (dane użytkownika)
insert into widz values(1, 'janina', 'wozniak', 'Zielona Gora', 'lubuskie', 'janina@email.com', 'widz1', 'w1');
insert into widz values(2, 'czeslaw', 'kozlowski', 'Zielona Gora', 'lubuskie', 'czeslaw@email.com','widz2', 'w2');
insert into widz values(3, 'kamil', 'kaczmarek', 'Swidnica', 'lubuskie', 'kamil@email.com','widz3', 'w3');
insert into widz values(4, 'adam', 'kwiatkowski', 'Zary', 'lubuskie', 'adam@email.com','widz4', 'w4');
insert into widz values(5, 'alicja', 'mazur', 'Gubin', 'lubuskie', 'alicja@email.com','widz5', 'w5');
insert into widz values(6, 'robert', 'grabowski', 'Sulechow', 'lubuskie', 'robert@email.com','widz6', 'w6');
insert into widz values(7, 'grzegorz', 'piotrowski', 'Nowa_Sol', 'lubuskie', 'grzegorz@email.com','widz7', 'w7');
insert into widz values(8, 'ryszard', 'nowakowski', 'Zielona Gora', 'lubuskie', 'ryszard@email.com','widz8', 'w8');
insert into widz values(9, 'hanna', 'zielinska', 'Sulechow', 'lubuskie', 'hanna@email.com','widz9', 'w9');
insert into widz values(10, 'danuta', 'jankowska', 'Zielona Gora', 'lubuskie', 'danuta@email.com','widz10', 'w10');
insert into widz values(11, 'teresa', 'maj', 'Swidnica', 'lubuskie', 'teresa@email.com','widz11', 'w11');
insert into widz values(12, 'franciszek', 'szymanski', 'Zielona Gora', 'lubuskie', 'franciszek@email.com','widz12', 'w12');
insert into widz values(13, 'waldemar', 'lipiec', 'Sulechow', 'lubuskie', 'waldemar@email.com','widz13', 'w13');
insert into widz values(14, 'krzysztof', 'ogorek', 'Zary', 'lubuskie', 'krzysztof@email.com','widz14', 'w14');
insert into widz values(15, 'patryk', 'dabrowski', 'Zagan', 'lubuskie', 'patryk@email.com','widz15', 'w15');
insert into widz values(16, 'izabela', 'kuc', 'Zielona Gora', 'lubuskie', 'izabela@email.com','widz16', 'w16');
insert into widz values(17, 'agata', 'slomka', 'Zielona Gora', 'lubuskie', 'agata@email.com','widz17', 'w17');
insert into widz values(18, 'katarzyna', 'pilka', 'Zielona Gora', 'lubuskie', 'katarzyna@email.com','widz18', 'w18');
insert into widz values(19, 'paulina', 'czerwiec', 'Sulechow', 'lubuskie', 'paulina@email.com','widz19', 'w19');
insert into widz values(20, 'karol', 'okrasa', 'Swidnica', 'lubuskie', 'karol@email.com','widz20', 'w20');
#Dodaję rekordy do tabeli administratora
insert into admin values(00000000000, 'admin', 'admin');
#Dodaję rekordy do tabeli zamówienie (kto, co, kiedy)
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 1,1, 1, '2016-07-01', '2016-07-01', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 2, 1, 16, '2016-07-01', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 3, 2, 30, '2016-07-01', '2016-07-03', '2016-07-05');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 4, 3, 19, '2016-07-02', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 5, 4, 21, '2016-07-02', '2016-07-03', '2016-07-05');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 6, 4, 28, '2016-07-02', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 7, 5, 29, '2016-07-02', '2016-07-04', '2016-07-06');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 8, 6, 17, '2016-07-02', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 9, 7, 5, '2016-07-03', '2016-07-04', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 10, 7, 11, '2016-07-03', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 11, 8, 18, '2016-07-03', '2016-07-04', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 12, 9, 26, '2016-07-03', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 13, 10, 4, '2016-07-03', '2016-07-04', '2016-07-06');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 14, 11, 9, '2016-07-03', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 15, 11, 6, '2016-07-03', '2016-07-04', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 16, 12, 2, '2016-07-03', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 17, 13, 12, '2016-07-03', '2016-07-05', '2016-07-06');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 18, 14, 15, '2016-07-03', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 19, 15, 25, '2016-07-04', '2016-07-05', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 20, 15, 27, '2016-07-04', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 21, 16, 20, '2016-07-04', '2016-07-05', '2016-07-06');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 22, 17, 22, '2016-07-04', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 23, 18, 8, '2016-07-04', '2016-07-05', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 24, 18, 13, '2016-07-04', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 25, 19, 10, '2016-07-04', '2016-07-06', '2016-07-07');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 26, 19, 7, '2016-07-04', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 27, 19, 24, '2016-07-04', '2016-07-06', null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 28, 19, 3, '2016-07-04', null, null);
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 29, 20, 23, '2016-07-04', '2016-07-06', '2016-07-07');
insert into zamowienie (id_zamowienie, id_widz, id_film, data_zamowienia, data_odbioru, data_zwrotu) values ( 30, 20, 14, '2016-07-04', null, null);
#Dodaję rekordy do tabeli film (spis filmów oraz podstawowe informacje o filmach)
insert into film values(1, 7, 000001, 'Zielona mila', 'Frank Darabond', '188', '1999', 'Emerytowany strażnik więzienny opowiada przyjaciółce o niezwykłym mężczyźnie, którego skazano na śmierć za zabójstwo dwóch 9-letnich dziewczynek.');
insert into film values(2, 1, 000001, 'Forrest Gump', 'Robert Zemeckis', '144', '1994', 'Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.');
insert into film values(3, 7, 000001, 'Skazani na Shawshank', 'Frank Darabond', '144', '1994', 'Adaptacja opowiadania Stephena Kinga. Niesłusznie skazany na dożywocie bankier, stara się przetrwać w brutalnym, więziennym świecie.');
insert into film values(4, '2', 000001, 'Matrix', 'Lilly Wachowski', '136', '1999', 'Haker komputerowy Neo dowiaduje się od tajemniczych rebeliantów, że świat, w którym żyje, jest tylko obrazem przesyłanym do jego mózgu przez roboty.');
insert into film values(5, '7', 000001, 'Leon zawodowiec', 'Luc Besson', '110', '1994', 'Płatny morderca ratuje dwunastoletnią dziewczynkę, której rodzina została zabita przez skorumpowanych policjantów.');
insert into film values(6, '6', 000001, 'Shrek', 'Andrew Adamson', '90', '2001', 'By odzyskać swój dom, brzydki ogr z gadatliwym osłem wyruszają uwolnić piękną księżniczkę.');
insert into film values(7, '5', 000001, 'Avatar', 'James Cameron', '162', '2009', 'Jake, sparaliżowany były komandos, zostaje wysłany na planetę Pandora, gdzie zaprzyjaźnia się z lokalną społecznością i postanawia jej pomóc. ');
insert into film values(8, '7', 000001, 'Titanic', 'James Cameron', '194', '1997', 'Rok 1912, brytyjski statek Titanic wyrusza w swój dziewiczy rejs do USA. Na pokładzie emigrant Jack przypadkowo spotyka arystokratkę Rose.');
insert into film values(9, '7', 000001, 'Gladiator', 'Ridley Scott', '155', '2000', 'Generał Maximus - prawa ręka cesarza, szczęśliwy mąż i ojciec - w jednej chwili traci wszystko. Jako niewolnik-gladiator musi walczyć na arenie o przeżycie.');
insert into film values(10, '1', 000001, 'Kac Vegas', 'Todd Phillips', '100', '2009', 'Czterech przyjaciół spędza wieczór kawalerski w Las Vegas. Następnego dnia okazuje się, że zgubili pana młodego i nic nie pamiętają.');
insert into film values(11, '6', 000001, 'Piraci z Karaibów', 'Gore Verbinski', '143', '2003', 'Kowal Will Turner sprzymierza się z kapitanem Jackiem Sparrowem, by odzyskać swoją miłość - porwaną córkę gubernatora.');
insert into film values(12, '6', 000001, 'Wladca Pierscieni', 'Pete Jackson', '178', '2001', 'Podróż hobbita z Shire i jego ośmiu towarzyszy, której celem jest zniszczenie potężnego pierścienia pożądanego przez Czarnego Władcę - Saurona.');
insert into film values(13, '7', 000001, 'Requiem dla snu', 'Daren Aronofsky', '102', '2000', 'Historia czwórki bohaterów, dla których używki są ucieczką przed otaczającą ich rzeczywistością.');
insert into film values(14, '4', 000001, 'Milczenie owiec', 'Jonathan Demme', '118', '1991', 'Seryjny morderca i inteligentna agentka łączą siły, by znaleźć przestępcę obdzierającego ze skóry swoje ofiary.');
insert into film values(15, '1', 000001, 'Seksmisja', 'Juliusz Machulski', '116', '1983', 'Rok 2044, zostają odhibernowani dwaj ostatni przedstawiciele płci męskiej. Władza jest w rękach Ligi Kobiet, która nie zamierza z niej zrezygnować.');
insert into film values(16, '7', 000001, 'Szeregowiec Ryan', 'Steven Spielberg', '170', '1998', 'W poszukiwaniu zaginionego szeregowca wysłany zostaje doborowy oddział żołnierzy.');
insert into film values(17, '4', 000001, 'Szosty zmysl', 'M. Night Shyamalan', '107', '1999', 'Psycholog dziecięcy próbuje pomóc ośmioletniemu chłopcu widzącemu zmarłych poradzić sobie z tym niezwykłym darem.');
insert into film values(18, '4', 000001, 'Pulp Fiction', 'Quentin Tarantino', '154', '1994', 'Przemoc i odkupienie w opowieści o dwóch płatnych mordercach pracujących na zlecenie mafii, żonie gangstera, bokserze i parze okradającej ludzi w restauracji.');
insert into film values(19, '8', 000001, 'Nietykalni', 'Olivier Nakache', '112', '2011', 'Sparaliżowany milioner zatrudnia do opieki młodego chłopaka z przedmieścia, który właśnie wyszedł z więzienia.');
insert into film values(20, '7', 000001, 'Slumdog. Milioner z ulicy', 'Danny Boyle', '120', '2008', 'Opowieść o młodym chłopaku, który bierze udział w hinduskiej edycji "Milionerów".');
insert into film values(21, '1', 000001, 'Dzien swira', 'Marek Koterski', '93', '2002', 'Adaś Miauczyński, 49-letni rozwiedziony polonista, żyje w kręgu swoich natręctw, nie potrafiąc wyrwać się z nudy i rutyny dnia codziennego.');
insert into film values(22, '6', 000001, 'Kod da Vinci', 'Ron Howard', '149', '2006', 'Ekranizacja powieści Dana Browna. Tajemnicze morderstwo w Luwrze staje się kluczem do rozwiązania jednej z największych zagadek strzeżonych przez tajemnicze stowarzyszenie.');
insert into film values(23, '4', 000001, 'Podziemny krag', 'David Fincher', '139', '1999', 'Dwóch mężczyzn znudzonych rutyną zakłada klub, w którym co tydzień odbywają się walki na gołe pięści.');
insert into film values(24, '7', 000001, 'Cast Away - poza swiatem', 'Robert Zemeckis', '143', '2000', 'W wyniku katastrofy lotniczej inżynier firmy kurierskiej trafia na bezludną wyspę, gdzie musi przeżyć.');
insert into film values(25, '9', 000001, 'Pianista', 'Roman Polanski', '150', '2002', 'Podczas drugiej wojny światowej Władysław Szpilman, znakomity polski pianista, stara się przeżyć w okupowanej Warszawie. ');
insert into film values(26, '6', 000001, 'Incepcja', 'Christopher Nolan', '148', '2010', 'Czasy, gdy technologia pozwala na wchodzenie w świat snów. Złodziej Cobb ma za zadanie wszczepić myśl do śpiącego umysłu.');
insert into film values(27, '4', 000001, 'Siedem', 'David Fincher', '127', '1995', 'Dwóch policjantów stara się złapać seryjnego mordercę wybierającego swoje ofiary wg specjalnego "klucza".');
insert into film values(28, '7', 000001, 'Bekarty wojny', 'Quentin Tarantino', '153', '2009', 'W okupowanej przez nazistów Francji oddział złożony z Amerykanów żydowskiego pochodzenia planuje zamach na Hitlera.');
insert into film values(29, '5', 000001, 'Krol Lew', 'Rob Minkoff', '89', '1994', 'Targany niesłusznymi wyrzutami sumienia po śmierci ojca mały lew Simba skazuje się na wygnanie rezygnując z przynależnego mu miejsca na czele stada.');
insert into film values(30, '7', 000001, 'Wyspa tajemnic', 'Martin Scorsese', '138', '2010', 'Szeryf federalny Daniels stara się dowiedzieć, jakim sposobem z zamkniętej celi w pilnie strzeżonym szpitalu dla chorych psychicznie przestępców zniknęła pacjentka.');

#Sprawdzenie właściwości tabeli
describe kategoria;
#Podgląd całej zawartości tabeli
select * from kategoria;
select * from widz;
select * from admin;
select * from zamowienie;
select * from film;
#Usunięcie kolumny z tabeli
#alter table film
#drop numer;
#Zmiana nazwy kolumny oraz typ danych
#alter table film
#change czas_trwania czas_trwania_min int(3);
#Wyszukaj filmy, których czas trwania jest dłuższy niż 140min i krótszy niż 180min
select * from film where czas_trwania_min > 140 and czas_trwania_min < 180;
#Wyszukaj filmy w reżyserii Jamesa Camerona
select * from film where rezyser = 'James Cameron';

#Łączenie trzech tabel przez Join i Natural Join (id_widz)- wybrane kolumny warunkowo wg czasu>170, odwrócone sortowanie, 
SELECT 
    imie, nazwisko, tytuł, czas_trwania_min
FROM
    zamowienie
        JOIN
    film
        NATURAL JOIN
    widz ON (widz.id_widz = zamowienie.id_widz)
WHERE
    zamowienie.id_film = film.id_film
        AND czas_trwania_min > 170
ORDER BY czas_trwania_min DESC;
#Zapytanie o filmy, które nie zostały jeszcze zwrócone i są niedostępne - zmiana nazwy kolumny i wartości null na niedostępny
SELECT 
    tytuł,
    COALESCE(data_zwrotu, 'niedostępny') AS dostępność
FROM
    zamowienie
        NATURAL JOIN
    film
WHERE
    zamowienie.id_film = film.id_film
GROUP BY tytuł
HAVING dostępność = 'niedostępny';
#Zapytanie o filmy, które zostały zwrócone i są dostępne - zmiana daty zwrotu na dostępny
SELECT 
    tytuł AS Tytuł,
    CASE
        WHEN data_zwrotu = data_zwrotu THEN 'dostępny'
    END AS 'Dostępność'
FROM
    zamowienie
        NATURAL JOIN
    film
WHERE
    zamowienie.id_film = film.id_film
GROUP BY tytuł
having Dostępność = 'dostępny';
#Tworzenie widoku filmów dostępnych do wypożyczenia
#create view dostepne as
SELECT 
    tytuł AS Tytuł,
    CASE
        WHEN data_zwrotu = data_zwrotu THEN 'dostępny'
    END AS 'Dostępność'
FROM
    zamowienie
        NATURAL JOIN
    film
WHERE
    zamowienie.id_film = film.id_film
GROUP BY tytuł
having Dostępność = 'dostępny';
select * from dostepne;
#Tworzenie widoku filmów niedostępnych do wypożyczenia
#create view niedostepne as
SELECT 
    tytuł,
    COALESCE(data_zwrotu, 'niedostępny') AS dostępność
FROM
    zamowienie
        NATURAL JOIN
    film
WHERE
    zamowienie.id_film = film.id_film
GROUP BY tytuł
HAVING dostępność = 'niedostępny';
select * from niedostepne;
#Trigger po dodaniu daty zwrotu filmu aktualizowana jest tabela dostepne filmy i lista się zwiększa
#create trigger dodanie_dostepnych_filmow
after insert on zamowienie
for each row update dostepne
set NEW.data_zwrotu = now();
#Trigger po dodaniu daty zwrotu filmu aktualizowana jest tabela niedostepne filmy i lista się zmniejsza
#create trigger mniej_niedostepnych_filmow
after insert on zamowienie
for each row update niedostepne
set NEW.data_zwrotu = now();
select * from dostepne;