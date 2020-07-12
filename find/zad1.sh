#!/bin/bash

if [ -d $1 ]
then
	find $1 \( -type f -size +100b -a -size -50b -perm /300 \( -name "*.jpg" -o -name "*.png" \) -delete \) , \( -type f -name ".*" ! -executable -printf "%n %i" \) , \( -type l -xtype d -print \) , \( -path "$1/*/*/*/*" -printf "ostatnia modyfikcja %a glebokosc %d" \)
else
	echo 'zla liczba lub niepoprawne argumenty\n'
fi
