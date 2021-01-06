#!/bin/bash
read -p "Enter in uppercase: " upper
echo -e "\nResult: \n"
echo $upper | tr '[A-Z]' '[a-z]'