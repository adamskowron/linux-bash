#!/bin/bash
#plik p $1 i katalog d $2

if [ -s $1 ] #pusty plik
then
	for f in $2/
	do
		echo $f #wypisanie katalogu
	done
elif [ -s $2 ] #pusty katalog
then
	cat $1
elif [ -s $1 ] && [ -s $2 ]
then
	echo 'oba pliki puste'
else
	counter=0
	for f in $2/
	do
		while IFS= read -r line
		do
		if [ $f != $line ]
		then
			echo $line
		fi
		done
	done
fi


#Dane są katalog D (pierwszy parametr skryptu) oraz plik regularny P (drugi parametr skryptu). P zawiera 
#(być może pustą) listę (zbiór wierszy). Należy wypisać różnice między D i P tzn. wypisać listę plików, 
#które są w D, ale nie ma ich na liście P oraz takich, które są na liście P, ale nie ma ich w katalogu D. 
#W zadaniu można wykorzytać jedną zagnieżdżoną pętlę for.
