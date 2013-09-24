#!/bin/bash

### Variables
remoteIP='66.69.107.240'

# Set username of non super user
user='hshirani'

# Port SSH is running on
sshPort='22'

# Update repository and upgrade system
apt-get update && apt-get upgrade

# Install requisites
apt-get install sudo vim denyhosts psad xserver-xorg gnome

# Set workstation to allow traffic from only your host
iptables -A INPUT -s $remoteIP -j ACCEPT
iptables -A INPUT -s 0.0.0.0 -j REJECT
iptables-save

# Force system to use vim as default editor
update-alternatives --set editor /usr/bin/vim.basic

# Add regular user
adduser $user

# Add regular user to sudoers
echo "$user		ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Create ssh directory for user
mkdir /home/$user/.ssh
touch /home/$user/.ssh/authorized_keys
chown -R $user:$user /home/$user/.ssh
chmod 0700 /home/$user/.ssh
chmod 0600 /home/$user/.ssh/authorized_keys
# Download NX packages
wget http://web04.nomachine.com/download/3.5.0/Linux/nxclient_3.5.0-7_amd64.deb
wget http://web04.nomachine.com/download/3.5.0/Linux/nxnode_3.5.0-9_amd64.deb
wget http://web04.nomachine.com/download/3.5.0/Linux/FE/nxserver_3.5.0-11_amd64.deb

# Install nx packages
dpkg -i nxclient*
dpkg -i nxnode*
dpkg -i nxserver*
