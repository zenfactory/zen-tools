#!/bin/bash

# Install security tools
apt-get install psad tcpdump chkrootkit rkhunter snort 

# Create security specific logs directory and subdirectories for different log types
mkdir /root/security/
mkdir /root/security/logs
mkdir /root/security/logs/chckroot
mkdir /root/security/logs/rkhunter
mkdir /root/security/logs/dpkg
mkdir /root/security/logs/tcpdump
mkdir /root/security/logs/snort

# Start tcp dump with rotating logs at boot
echo "tcpdump -n -C 500 -W 100 -i eth0 -w /root/security/logs/tcpdump/eth0-`date +%s`.pcap &" >> /etc/rc.local

# Run root kit checkers at boot
echo "chkrootkit > /root/security/logs/chkroot/chkroot-`date +%s`.txt &" >> /etc/rc.local
echo "rkhunter --check --cronjob > /root/security/logs/chkroot/rkhunter-`date +%s`.txt &" >> /etc/rc.local

# Start snort at boot
echo "snort  > /root/security/logs/snort/snort-`date +%s`.txt &" >> /etc/rc.local

# Get list of installed packages at boot (useful to determine if any new packges have been installed). 
echo "dpkg --get-selections > /root/security/logs/dpkg/installed-packages-`date +%s`.txt &" >> /etc/rc.local
