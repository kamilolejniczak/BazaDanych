# -*- coding:UTF-8 -*-

import pymysql
#utworzenie klasy Projekt
class Projekt:
    #utworzenie definicji wywołującej logowanie do biblioteki za pomocą loginu i hasła zdefiniowanych w bazie danych
    #po zalogowaniu możliwość wyboru akcji np. przeszukanie bazdy danych po tytule
    def logowanie(self):
        conn = pymysql.connect(host='localhost', user='root', passwd='kamil2017', db='bfv1', charset='utf8mb4')
        cur = conn.cursor()        
        login = str(input("Podaj login: "))
        haslo = str(input("Podaj haslo: "))
        bfv1 = "SELECT * FROM widz WHERE login=%s and haslo=%s"
        cur.execute(bfv1,(login,haslo))
        
        if(cur.rowcount == 1):
            print("Zalogowano poprawnie")
            nav = ''
            while(nav != "Q"):
                nav = input("Co chcesz zrobić?: (D)-zobacz filmy dostępne (ND)-zobacz filmy niedostępne (S)-szukaj (Q)-zakończ ")
                if(nav == "D"):
                    self.odczytD()
                elif(nav == "ND"):
                    self.odczytND()
                elif(nav == "S"):
                    self.odczytS()                
            
        else:
            print("Błąd logowania")
     #utworzenie definicji odczytującej z bazy danych biblioteki filmy dostępne      
    def odczytD(self):
        conn = pymysql.connect(host='localhost', user='root', passwd='kamil2017', db='bfv1', charset='utf8mb4')
        cur = conn.cursor()
        cur.execute("SELECT * FROM dostepne")
        print("Filmy")
        print("============================================")    
        for row in cur:
            Tytuł = row[0]
            Dostępność = row[1]
            print("Tytuł = %s, Dostępność = %s" % (Tytuł, Dostępność))
        cur.close()
        conn.close()
    #utworzenie definicji odczytującej z bazy danych filmy niedostępne    
    def odczytND(self):
        conn = pymysql.connect(host='localhost', user='root', passwd='kamil2017', db='bfv1', charset='utf8mb4')
        cur = conn.cursor()
        cur.execute("SELECT * from niedostepne")
        print("Filmy")
        print("============================================")
        for row in cur:
            Tytuł = row[0]
            Dostępność = row[1]
            print("Tytuł = %s, Dostępność = %s" % (Tytuł, Dostępność))
        cur.close()
        conn.close()
    #utworzenie definicji odczytującej z bazy danych filmy, wyszukanie po tytule
    def odczytS(self):
        conn = pymysql.connect(host='localhost', user='root', passwd='kamil2017', db='bfv1', charset='utf8mb4')
        cur = conn.cursor()
        tytuł = str(input("Podaj tytuł filmu: "))
        bfv1 = "SELECT * from film where tytuł=%s"
        cur.execute(bfv1, tytuł)
        for row in cur:
            Tytuł = row[2]
            Reżyser = row[3]
            Czas_trwania = row[4]
            Rok_premiery = row[5]
            Opis = row[6]
            print("Tytuł = %s \nReżyser = %s \nCzas_trwania = %smin \nRok_premiery = %s \nOpis = %s" 
                    % (Tytuł, Reżyser, Czas_trwania, Rok_premiery, Opis))
     
    
a = Projekt()
a.logowanie()


    
    
    


