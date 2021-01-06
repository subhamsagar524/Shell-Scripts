echo -e "Enter some small letter sentences: \n Press CTRL + d when you are done\n"
cat >file
echo -e "\nResult:\n"
cat file | while read line
do
	echo "${line^}"
done
