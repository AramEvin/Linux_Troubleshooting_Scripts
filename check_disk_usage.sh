#!/bin/bash

echo "===== DISK USAGE ====="
df -h | grep -v tmpfs

echo -e "\n===== TOP 10 LARGEST FILES IN ROOT (/) ====="
sudo du -ahx / | sort -rh | head -n 10

echo -e "\n===== INODE USAGE ====="
df -i


#OUTPUT EXAMPLE
#===== DISK USAGE =====
#Filesystem      Size  Used Avail Use% Mounted on
#/dev/sda1        40G   35G  3.0G  93% /
#
#===== TOP 10 LARGEST FILES IN ROOT (/) =====
#2.3G /var/log/bigfile.log
#1.8G /home/user/download.iso
#...
#
#===== INODE USAGE =====
#Filesystem     Inodes  IUsed  IFree IUse% Mounted on
#/dev/sda1      655360  62000 593360    10% /

