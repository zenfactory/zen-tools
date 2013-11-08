#!/bin/bash

# Defines
GUID=12111
imgExt='jpg'
imgDir='date-1383901636'

# Print CSV Header
echo "guid,title,description,path"

# Loop through ASC / ANSI files
for fileName in $(ls /var/www/zenfactory/sites/default/files/$imgDir | grep $imgExt)
do
	# Extract root name
	fileRoot=$(echo -n $fileName | awk -F "." '{print $1}')

	# Print CSV Output
	echo "$GUID,$fileRoot,$fileRoot,public://$imgDir/$fileName"

	# Increment GUID
	GUID=$[GUID + 1]
done
