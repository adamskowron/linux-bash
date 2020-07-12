import sys
import os

pathK1=os.path.realpath(sys.argv[1])
pathK2=os.path.realpath(sys.argv[2])
pathT=os.path.realpath(sys.argv[3])

if os.path.isdir(pathK1) == True and os.path.isdir(pathK2) == True and os.path.isdir(pathT) == True and len(sys.argv) == 4 :
    for f in os.listdir(pathK1) :
        filepath=os.path.join(pathK1,f)
        if os.path.isdir(filepath) == True and os.access(filepath, os.W_OK) == False :
            lnname=pathK2 + "/" + f + "ln"
            os.symlink(filepath, lnname)
                
    print("--------------------ZAD2--------------------------")            
    for file in os.listdir(pathK1) :    
        filepath=os.path.join(pathK1,file)
        if os.path.isfile(filepath) == True :
            with open(filepath) as f :
                print(f.read())

    print("---------------------ZAD3-------------------------")
    for r,d,f in os.walk(pathT) :
        for i in f :
            pathfile=os.path.join(r,i)
            if os.path.isfile(pathfile) == True and os.path.getsize(pathfile) < 100 and os.stat(pathfile).st_nlink == 1 :
                print(i)

else :
    print("bledne argumenty")

#Dane sa katalogi K1, K2 oraz T (argumenty skryptu). K1 i K2 sa rozumiane jako katalogi ,,jednopoziomowe"
#(tzn. interesuja nas tylko pliki bezposrednio w tym katalogu, a nie glebiej), 
#zas T jest rozumiane jako cale drzewo katalogowe (dowolnej glebokosci). Nalezy.
#1. Utworzyc w K2 linki symboliczne do katalogow w K1, do ktorych my
#(wykonawca skryptu) nie mamy prawa zapisu. [3]
#2. Wypisac na ekran zawartosc plikow zwyklych z K1. [2]
#3. W T nalezy znalezc (wypisac nazwy) pliki zwykle, ktore jednoczesnie:
#(1) maja rozmiar do 100 bajtow
#oraz (2) maja dokladnie jedno twarde dowiazanie. [3]