#!/bin/bash

a=$(ls -id $1)
b=$(ls -id $2)

if [ -d $1 ] && [ -d $2 ] && [ "$a" != "$b" ]
then
	for f in $1/*; do
		if [ -h $f ]
		then
			link=$(readlink $f)
			if [ "$link" != "/*" ]
			then
				#rm $f
				echo "usuwam $f"
			fi
		fi
	done

	for f in $1/*; do
		if [ -f $f ]
		then
			ln -s $f $2
		fi
	done
else
	echo "Podano zle argumenty"
fi

#Dane są dwa katalogi D1 i D2 (dwa argumenty skryptu). Jeśli D1 i D2 odwołują się do tego samego katalogu,
#to skrypt powinien się zakończyć. W przeciwnym razie należy z D1 usunąć wszystkie dowiązania symboliczne zdefiniowane ścieżką względną,
#następnie stworzyć w D2 linki do wszystkich plików zwykłych w D1
