#!/bin/bash

# Generate url encoded string from keyfile
keyfile=$(cat /home/hshirani/.ssh/id_rsa.pub)
#echo $keyfile
echo "$(perl -MURI::Escape -e 'my $encoded = uri_escape($keyfile); print $encoded;')"
