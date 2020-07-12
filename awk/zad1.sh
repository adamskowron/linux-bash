#!/bin/bash

if [ -f $1 ] && [ $# -eq 1 ]
then
	cat $1 | gawk '{sub(/^#.*$/,"#");}; 
	{for(i=1;i<=NF;i++)
	{ 
		if(match($i,/[-+]?[0-9]*\.?[0-9]+/))
		{
			x+=$i;
			y+=1
		}
	;}};
	
	
	{for(i=1;i<=NF;i++)
	{
		if(match($i,/[012]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}/))
		#if(match($i,/[012]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}[:blank:][pa]\.m\./))
	{
		gsub(/[^a-zA-Z0-9 -]/, "-", $i);
		gsub(/[^a-zA-Z0-9 [pa]\.m\.]/, "", $i)
	}
	}};
	
	NF {print $0;}
	
	END{print x/y}'	
else
	echo 'niepoprawne argumenty\n'
fi

#Dany jest plik zwykły P (argument skryptu). Należy wypisać ten plik na ekran z następującymi zmianami:
#1. Nie wypisywać linii pustych. (1)
#2. Nie wypisywać treści komentarzy basha (od znaku # do końca linii). (2)
#3. Zamienić wszystkie czasy formatu 10:45:56 a.m. (lub odpowiednio p.m.) na 10-45-56 (lub odpowiednio 22-45-56). Uwaga: czasy mogą występować wielokrotnie w tej samej linii! (4)
#4. Wypisać średnią liczb znalezionych w pliku 
#(uwaga: liczby mogą być całkowite lub ułamkowe, notację naukową zignorować. Liczby mogą występować wielokrotnie w tej samej linii). (3)
