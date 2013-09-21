#!/bin/bash

# Check to make sure we have everything we need
echo "$#"
if [ "$#" == 4 ]
then

	# Setup Vars
	port=$1
	user=$2
	host=$3
	keyFile=$4

	# Send key to remote host and append it to the authorized key's file
	cat $keyFile | ssh -p $3 $user@$host "cat - ~/.ssh/authorized_keys > ~/.ssh/authorized_keys_new && mv ~/.ssh/authorized_keys_new .ssh/authorized_keys"
fi
