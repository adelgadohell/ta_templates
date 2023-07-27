#!/bin/bash

# Reconfigure the SSH service to listen on port 2222.

sed -Ei 's/^#?([[:space:]]?)+Port([[:space:]]?22([[:space:]]?)+)+$/Port 2222 # Modified by automation./' /etc/ssh/sshd_config
# Next line not needed as we are rebooting afterwards
# systemctl reload sshd

# Break root filesystem mount by swapping the first two groups of characters in the UUID and reboot to get broken VM
sed -Ei '/[[:space:]]\/[[:space:]]/s/UUID=(...)(...)/UUID=\2\1/' /etc/fstab
reboot
