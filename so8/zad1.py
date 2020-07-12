import sys
import os
import re
import glob


pathD=os.path.realpath(sys.argv[1])
pathP1=os.path.realpath(sys.argv[2])
pathP2=os.path.realpath(sys.argv[3])

if os.path.isdir(pathD) == True and os.path.isfile(pathP1) == True and os.path.isfile(pathP2) == True and len(sys.argv) == 4 :

   l = list([x[0] for x in os.walk(pathD)])
   list1=list()
   list2=list()
   
   for elem in l:
        count=0
        s = ''.join(elem)
        for f in os.listdir(s):
            if f.startswith('.'):
                count = count+1
        list1.append(os.path.basename(s) + 'pliki ukryte' + str(count))

   for r,d,f in os.walk(pathD) :
        for i in f :
            pathfile=os.path.join(r,i)
            if os.path.isfile(pathfile) == True :
                inode=(os.stat(pathfile).st_ino)/100
                list2.append(i + ' iwezel ' +str(inode))

   list1.sort()
   for f in list1:
       with open(pathP1, 'a') as file:
           file.write(f)
       print(f)
       
   list2.sort()
   for f in list2:
       with open(pathP1, 'a') as file:
           file.write(f)
       print(f)

   with open(pathP2) as f:
       content = f.readlines()
       r = re.compile('#include ((<[^>]+>)|("[^"]+"))')
       newlist = list(filter(r.match, content))
       for elem in newlist:
           
           elem=elem[9:]
           elem.strip()
           elem=elem[1:]
           elem=elem[:-2]
           print elem

else :
    print("bledne argumenty")

# Dane jest drzewo katalogowe D i dwa pliki zwykle P1 i P2 (argumenty skryptu).
# 1. W D dla kazdego katalogu nalezy wyswietlic jego nazwe (ostatni czlon)
 # i liczbe ukrytych plikow, zas dla kazdego pliku zwyklego nalezy wyswietlic jego nazwe
 # (ostatni czlon) i numer i-wezla podzielony przez 100
 # (bez znaczenia czy dzielenie jest calkowitoliczbowe lub czy zmiennoprzecinkowe). (4 pt)
# 2. Wyniki z punktu 1 nalezy dodatkowo posortowac (przed wyswietleniem) 
# wg nazwy pliku i zapisac do P1. (2 pt)
# 3. Nalezy wypisac nazwy wszystkich plikow dolaczonych do P2 dyrektywa 
# #include znana z jezykow C/C++. Mozna zalozyc, ze dyektywa #include 
# zajmuje caly wiersz (tzn. linia zawiera co najwyzej jedna taka dyrektywe i 
# jesli ja zawiera, to nie zawiera nic innego). Nalezy pamietac, ze istnieja dwa 
# sposoby dolaczania plikow (wersja <file> oraz wersja "file"). 
# Po slowie include moze byc opcjonalnie spacja. (3 pt)