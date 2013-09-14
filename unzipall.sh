#!/bin/bash
for x in `ls /home/hshirani/mess/gba`
do
	fileExt=`echo -n $x | awk -F "." '{print $2}'`
	if [ "$fileExt" == "zip" ]
	then
		unzip -u "/home/hshirani/mess/gba/$x"
	fi
done
