#!/bin/bash

###
# Make sure adb is installed
###
#sudo apt-get install android-tools-adb

###
# Define image locationes
###

# Where do you keep all your photos
imgRoot="/home/`whoami`/Pictures"

# A new directory based on the current unix epoch to store this image pull
imgDir="date-1378538859"

# Define template files
templateFile="$imgRoot/$imgDir/drupal_.csv"

# Create template header
echo "guid,path,title" > $templateFile

# Create folder on remote machine
ssh -p 2260 hshirani@september.zenfactory.org "mkdir /var/www/zenfactory/sites/default/files/$imgDir"

# Append image names and guid's to template
for x in $(ls $imgRoot/$imgDir | grep jpg)
do
	convert -scale 1024x768 $x $x
	scp -P 2260 $x hshirani@september.zenfactory.org:/var/www/zenfactory/sites/default/files/$imgDir/$x
done

# Run template creation script 
ssh -p 2260 hshirani@september.zenfactory.org "/home/hshirani/import.sh" >> $templateFile
