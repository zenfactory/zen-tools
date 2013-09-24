#!/bin/bash

# Check to make sure we have everything we need
#if [ "$#" == 7 ]
#then
	echo "condition passed"

	###
	# Setup Vars
	###

	# Paramargs
	keyName=$1
	clientId=$2
	apiKey=$3
	keyString="$4 $5 $6"
	url="https://api.digitalocean.com/ssh_keys/new/?name=$keyName&ssh_pub_key=$keyString&client_id=$clientId&api_key=$apiKey"
	echo $url> keyAccountUrl.url
	# Send key to remote host and append it to the authorized key's file
	#curl -ikv $url
#fi
