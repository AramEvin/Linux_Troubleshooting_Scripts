#!/bin/bash
# check_logs.sh - Collect and analyze critical logs using journalctl and dmesg

echo "===== LAST 50 SYSTEM LOGS (journalctl) ====="
journalctl -xe -n 50 --no-pager

echo -e "\n===== KERNEL LOGS (dmesg -T | grep -i error/warn) ====="
dmesg -T | grep -iE "error|warn"

echo -e "\n===== FAILED SERVICES LOGS (last 24h) ====="
sudo journalctl -p 3 -xb --since "24 hours ago"

echo -e "\n===== AUTHENTICATION FAILURES (last 24h) ====="
sudo journalctl _COMM=sshd --since "24 hours ago" | grep -i "fail"

echo -e "\n===== CUSTOM: LAST REBOOTS ====="
journalctl --list-boots | head -n 5
