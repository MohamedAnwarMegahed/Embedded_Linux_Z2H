#!/bin/sh
#------------------------------------------Section 1-----------------------------------------
#this command is used to change the shell prompt
export PS1='<MP3_shell> : \w$'

modprobe snd-bcm2835

#------------------------------------------Section 2-----------------------------------------
echo "Welcome to BuildRoot MP3 Player"

source /root/superMusic/var/Curser
echo Curser=0 > /root/superMusic/var/Curser

whatever()
{
source /root/superMusic/var/Curser 
sleep 2

currentState=0
currentVal=0
firstTimeFlag=0
#------------------------------------------Section 3-----------------------------------------
while true ; do
	#------------Section 3.2-------------
	sleep 1
	source /root/superMusic/var/Curser
	source /root/superMusic/var/songArray
	source /root/superMusic/var/State
	
	no_of_songs_media=$(find /media/ /songs -name "*.mp3" | wc -l)
	currentVal=$Curser
	currentState=$State

			#----------------Section 3.1---------------------
			if [ $no_of_songs_media -eq 0 ] ; then
			echo "No .MP3 files found"
			elif [ "$currentState" == "Running" ] ; then
			sleep 0.5			
			echo "$(basename ${songArray[$Curser]}) is now playing "
			else
			if  [ $firstTimeFlag -eq 1 ] ; then				
			espeak "The song is paused" --stdout | aplay
			echo "The song is Paused"
			fi
			firstTimeFlag=1
			fi


done
}

whatever &
