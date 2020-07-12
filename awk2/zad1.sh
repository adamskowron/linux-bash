#!/bin/bash

if [ -f $1 ] && [ $# -eq 1 ]
then
	cat $1 | awk --re-interval '
		BEGIN{OFS=" "}
		{if(match($0,/[0-9][0-9]([0-9][0-9])-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])/,a))
			{
				if(length(a[2]) == 1)
				{
					a[2] = "0" a[2];
				}
				if(length(a[3]) == 1)
				{
					a[3] = "0" a[3];
				}
				print a[1] ":" a[2] ":" a[3]

			}
			
		
	}'
	
	
else
	echo 'niepoprawne argumenty\n'
fi
