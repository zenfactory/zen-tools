#!/bin/bash

# Check to make sure we have everything we need
echo "$#"
if [ "$#" == 3 ]
then

	# Setup Vars
	user=$1
	host=$2
	keyFile=$3

	# Send key to remote host and append it to the authorized key's file
	cat $keyFile | ssh $user@$host "cat - ~/.ssh/authorized_keys > ~/.ssh/authorized_keys_new && mv ~/.ssh/authorized_keys_new .ssh/authorized_keys"
fi
