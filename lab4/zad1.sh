#!/bin/bash

if [ -d $1 -a -f $2 ]
then
	var=0
	find $1 | while read -r var
	do

		if [ -f $var ]
		then
			tail -n 2 $var | head -n 1 | awk '{print $2}' >> P
		fi
<<K
		if [ -d $var ]
		then
			ls -l * | sed -r 's/r/o/g' | sed -r 's/w/z/g' | sed -r 's/x/w/g' >> P
		fi

		if [ -L $var ]
		then
		link = readlink $var
			if [ ! -e $var]
			then
				echo '$var 0' >> P
			elif [ -f link ]
			then
				readlink $var | wc -l >> P
			fi
		fi
	done | sort P | rev | head -n 7

	#sort P | rev >> P | head -n 7

K
done #usun
else
        echo 'niepoprawne argumenty\n'
fi


#Dane jest drzewo katalogowe D i plik regularny P (argumenty skryptu).

#– dla każdego pliku zwykłego należy wypisać drugie słowo w przedostatniej linii (komendy head, cut itp.) (3),
#– dla każdego dowiązania symbolicznego na plik zwykły należy wypisać liczbę linii w jego celu lub (dla błędnego linku zero), (3)
#– dla każdego katalogu należy wypisać jego prawa w wersji polskiej (zamieniając rwx na np. ozw) (3),
#Wyniki posortować, wysłać do pliku P, odwrócić kolejność znaków w liniach i wyświetlić na ekranie pierwsze 7 wyników. (3)
