import os
import sys

    
txt = "/tmp/plik.txt"

# setting the maxsplit parameter to 1, will return a list with 2 elements!
x = txt.rsplit(".", 1)[0]

print(x)