#!/bin/bash

function getStr()
{
	read -p "Enter String: " str
	read -p "Enter Offset: " off
	read -p "Enter Length: " len

	echo ${str:off:len}
}

getStr
