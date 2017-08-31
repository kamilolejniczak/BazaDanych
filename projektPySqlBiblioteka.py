# -*- coding: utf-8 -*-

import pymysql

class Projekt:
    def __init__(self):
        self.conn = pymysql.connect('localhost','root', 'kamil2017','bfv1')
        self.cursor = self.conn.cursor()
        print("Połączenie ustanowione")
        print("Połączenie zakończone")
        self.conn.close()        
    def logowanie():
        bfv1 = "SELECT * FROM widz WHERE login=%s and haslo=%s"
        self.cursor.execute(bfv1,(login,haslo))
        if(self.cursor.rowcount == 1):
            print("Zalogowano poprawnie")
            self.i = input('Co chcesz zrobić?: \n (s)Zobacz rekordy \n (f) Znajdź film')
            if self.i == 's':
                self.odczyt()
                self.logowanie()
            if self.i == 'f':
                self.znajdz_film()
                self.logowanie()            
        else:
            print("Błąd logowania")
            
        print("Połączenie zakończone")
        self.conn.close()        
    def select(self):
        self.c.execute("SELECT dostepne from zamowienie;")
        res = self.c.fetchall()
        for v in res:
            id_zamowienie = v[0]
            imie = v[1]
            nazwisko = v[2]
            print("%3s %10s %15s" % (id_zamowienie, imie, nazwisko))    
        print("Połączenie zakończone")
        self.conn.close()        
#---------------------------------------------------------------------------------------------
