#!/bin/bash

if [ ! $1 -ef $2 ]
then
	for f in $1/*
	do
			if [ -f $f ]
			then
				ln -f $f $2
			elif [ -d $f ]
			then
				ln -f -s $(realpath $f) $2
			fi
	done

fi

#sprawdzic czy to sa te same katalogi D1 i D2 
#W d1 utworzyc linki do plikow zwyklych i katalogow w katalogu d2,
#tam gdzie sie da twarde, a tam gdzie sie nia da to symbloiczne
#pominac wszystko co nie jest linkiem 
