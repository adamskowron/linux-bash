import os
import sys

filepath=sys.argv[1]
dirpath=sys.argv[2]

tab=list()

file=open(filepath,'r')
lines=file.readlines()

for line in lines :
    with open(dirpath + "/" +line,"w") as file:
        pass
    