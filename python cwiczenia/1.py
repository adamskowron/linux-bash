import os
import sys

path = sys.argv[1]
print path
for file in os.listdir(path) :
        if os.access(path+"/"+file, os.W_OK) == True :
            newname=file + ".old"
            os.rename(path + "/" + file,path + "/" + file + ".old")
  #  
    #       os.rename(str(file),str(file + ".old"))
    #else :
      #  print os.access(file, os.W_OK)