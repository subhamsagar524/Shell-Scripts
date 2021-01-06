#!/bin/bash
echo -e "Enter some small letter string: \n Press CTRL + D when you are done\n"
cat >file
filedata=`cat file`
echo -e "\nYou entered: "
echo $filedata
echo $filedata | tr '[a-z]' '[A-Z]' >outfile
echo -e "\nResult: "
cat outfile