#!/bin/bash

###
# Make sure everything is installed
###
sudo apt-get install android-tools-adb imagemagick

###
# Define image vars
###
GUID=12111
imgExt='jpg'
webRoot='/var/www/zenfactory.org/'
webFiles='/sites/default/files'

# Where do you keep all your photos
imgRoot="/home/`whoami`/Pictures"

# A new directory based on the current unix epoch to store this image pull
export imgDir="date-1383901636"

# Create the directory
templateDir="$imgRoot/$imgDir"

# Define template files
templateFile="$imgRoot/$imgDir/drupal_.csv"

# Instantiate template files
touch $templateFile

# Create template header
echo "guid,title,description,path" > $templateFile

# Create folder on remote machine
ssh hassan@september.zenfactory.org "mkdir $webRoot/$webFiles/$imgDir"

# Loop through files
for x in $(ls $imgRoot/$imgDir | grep jpg)
do
	# Extract File Root
    fileRoot=$(echo -n $fileName | awk -F "." '{print $1}')

	# Print CSV Output
    echo "$GUID,$fileRoot,$fileRoot,public://$imgDir/$fileName"	>> $templateFile

	# Append image names and guid's to template
	convert -scale 1024x768 $x $x
	scp $x hassan@september.zenfactory.org:$webRoot/$webFiles/$imgDir/$x

	# Increment GUID
    GUID=$[GUID + 1]
done

# Copy template creation script to web files root
scp $templateFile hassan@september.zenfactory.org:/var/www/zenfactory.org/sites/default/files/$imgDir/.
