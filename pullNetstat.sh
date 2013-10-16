#!/bin/bash

# Pull netstat don't resolve hostnames (takes forever / second part of script will handle it)
echo $(date +%c) >> "/home/`whoami`/logs/netstat"
echo -n " " >> "/home/`whoami`/logs/netstat"
netstat -n | awk '{if ($5 ~ /[0-9]+/) print $5 " " $6}' >> "/home/`whoami`/logs/netstat"
echo "" >> "/home/`whoami`/logs/netstat"
