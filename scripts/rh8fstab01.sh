#!/bin/bash
# Reconfigure the SSH service to listen on port 2222.
sed -Ei 's/^#?([[:space:]]?)+Port([[:space:]]?22([[:space:]]?)+)+$/Port 2222 # Modified by automation./' /etc/ssh/sshd_config

#Adding port to SELinux
systemctl stop sshd
semanage port -a -t ssh_port_t -p tcp 2222
systemctl start sshd
sleep 5

#Adding port to firewall
systemctl stop firewalld
firewall-offline-cmd --zone=public --add-port=2222/tcp

# Breaking the system by adding a wrong fstab entry.
sed -i '$a /dev/mapper/vg/notexist /notexist xfs defaults 0 0' /etc/fstab

#Restarting the system
reboot
