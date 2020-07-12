import sys
import os
import os.path

path=os.path.realpath(sys.argv[1])
print path
for file in os.listdir(path) :  #!!!!!    
    filepath=path + "/" + file
    print filepath
    if os.path.isfile(filepath) :
        if os.access(filepath, os.X_OK) == False :
            os.remove(filepath)
            
            #wzglednie ok
            
        