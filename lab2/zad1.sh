#!/bin/bash

if [ -d $1 ] && [ "$#" -e 1 ]
then

for f in $1/*
do
	if [ -w $f ] && [ -f $f ]
	then
		echo '---'
		echo $f
		echo -e '---\n'
		cat $f
		echo -e '\n'
	fi
done
else
	echo 'zla liczba lub niepoprawne argumenty\n'
fi
#Dany jest katalog D (pierwszy parametr skryptu). Należy wypisać na ekran zawartość wszystkich plików
#regularnych, które znajdują się w katalogu D i do których my (nasz skrypt) mamy prawo zapisu. Kolejność 
#w jakiej pliki zostaną połączone jest nieistotna. W Wydruku treść każdego pliku powinna być poprzedzona 
#nagłówkiem z jego nazwą.
