#!/bin/bash

# Reconfigure the SSH service to listen on port 2222.

sed -Ei 's/^#?([[:space:]]?)+Port([[:space:]]?22([[:space:]]?)+)+$/Port 2222 # Modified by automation./' /etc/ssh/sshd_config
# Next line not needed as we are rebooting afterwards
# systemctl reload sshd

# Break fstab by adding an invalid entry
sed -i '$aUUID=01e33816-57e4-4897-b4b2-083faa083bc8       /data01        ext4   defaults       0 2' /etc/fstab
mkdir /data01
reboot
