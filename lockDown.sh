#!/bin/bash

# Start firewall's now
#/home/hshirani/repo/zen-tools/fw-eth0.fw
#/home/hshirani/repo/zen-tools/fw-usb0.fw
#/home/hshirani/repo/zen-tools/fw-wlan0.fw
#/home/hshirani/repo/zen-tools/fw-wlan1.fw

# Run root kit checkers  now
chkrootkit > /root/security/logs/chkroot/chkroot-`date +%s`.txt
rkhunter --check --cronjob > /root/security/logs/chkroot/rkhunter-`date +%s`.txt

# Get list of installed packages now
dpkg --get-selections > /root/security/logs/dpkg/installed-packages-`date +%s`.txt

# Start tcp dump now
tcpdump -n -C 500 -W 100 -i eth0 -w /root/security/logs/tcpdump/eth0-`date +%s`.pcap &
tcpdump -n -C 500 -W 100 -i wlan0 -w /root/security/logs/tcpdump/wlan0-`date +%s`.pcap &
tcpdump -n -C 500 -W 100 -i wlan1 -w /root/security/logs/tcpdump/wlan1-`date +%s`.pcap &
tcpdump -n -C 500 -W 100 -i usb0 -w /root/security/logs/tcpdump/usb0-`date +%s`.pcap &


# Start snort now
cd /root/security/logs/snort
snort -i eth0 -b & 
snort -i wlan0 -b & 
snort -i wlan1 -b & 
snort -i usb0 -b & 
