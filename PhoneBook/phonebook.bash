#!/bin/bash

if [ ! -e ~/Desktop/phonebook.txt ]
	then
		touch ~/Desktop/phonebook.txt
		chmod u+rx ~/Desktop/phonebook.txt
fi
function search 
{
	read -p "Enter The name you want to search for : " wanted_name

	if grep "$wanted_name" ~/Desktop/phonebook.txt
	then 
		echo Succesfull
	else
		echo Failed
	fi
}

case $1 in 

	-v)
	echo "Name                      : Phone Numbers "
	cat ~/Desktop/phonebook.txt
	;;

	-i)
	read -p "Enter the name : " name
	echo -n $name >> ~/Desktop/phonebook.txt
	read -p "Enter the number of Phone numbers : " num
	i="0"
	while [ $i -lt $num ]
		do
		read -p "Enter Phone Number  : " number
		echo -n '          '$number >> ~/Desktop/phonebook.txt
		i=$[$i+1]
		done
	echo >> ~/Desktop/phonebook.txt
	;;

	-s)
	search
	;;

	-e)
	echo all Contacts deleted
	echo > ~/Desktop/phonebook.txt
	;;

	-d)
	read -p "Enter The name you want to delete : " wanted_name
	touch ~/Desktop/temp.txt
	if grep -wE "$wanted_name   " ~/Desktop/phonebook.txt > ~/Desktop/temp.txt
		then 
		echo Found and Removed
		grep -vwE "$wanted_name   " ~/Desktop/phonebook.txt > ~/Desktop/temp.txt
		cat ~/Desktop/temp.txt > ~/Desktop/phonebook.txt
		rm ~/Desktop/temp.txt
	else
		echo Not Found
	fi
	;;

	*)
	echo 'the options are : '
	echo '-i to insert contact name and number'
	echo '-v to view all contact saved'
	echo '-s to search by contact name'
	echo '-e to delete all contacts'
	echo '-d to delete only one contact'
	;;


esac


