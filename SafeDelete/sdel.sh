#!/bin/bash

if [ ! -d ~/Trash ]	  		
	then
		mkdir ~/Trash
		chmod u+rx ~/Trash
fi
find ~/Trash -mtime +2 -delete

for var in "$@"
	do
	if [ -d $var ]
	then
		
		#compress the folder
		tar czf $var.tar.gz -P $var
		rm -r $var
		mv $var.tar.gz ~/Trash
		echo "The folder has been Compressed and sent to the Trash"
									
	elif [ -e $var ]
	then
		if gunzip -k $var
		then
			name=${var%.*}
			rm -r $name
			mv $var ~/Trash
			echo "The gzip file has been directly moved  to the Trash"
			
		else
		#compress the file
		tar czf $var.tar.gz -P $var
		rm $var
		mv $var.tar.gz ~/Trash
		echo "The file has been Compressed and sent to the Trash"
		fi
	else
		echo "Faital Error :The File / Folder does not exist!"
	fi
			

	done
