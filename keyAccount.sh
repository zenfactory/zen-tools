#!/bin/bash

# Check to make sure we have everything we need
echo "$#"
if [ "$#" == 6 ]
then

	###
	# Setup Vars
	###

	# Paramargs
	port=$1
	user=$2
	host=$3
	keyFile="$4 $5 $6"

	# Generate url encoded string from keyfile
	#keyString=`php urlEncode.php $(cat ~/.ssh/id_rsa.pub)`
	keyString="$(perl -MURI::Escape -e 'print uri_escape($keyFile);')"
	echo $keyString

	# Send key to remote host and append it to the authorized key's file
	#cat $keyFile | ssh -p $port $user@$host "cat - ~/.ssh/authorized_keys > ~/.ssh/authorized_keys_new && mv ~/.ssh/authorized_keys_new .ssh/authorized_keys && chmod g-w ~/.ssh/authorized_keys"
	#curl -ikv https://api.digitalocean.com/ssh_keys/new/?name=[ssh_key_name]&ssh_pub_key=[ssh_public_key]client_id=[your_client_id]&api_key=[your_api_key]
fi
