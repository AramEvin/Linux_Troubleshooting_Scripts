#!/bin/bash
# check_network_status.sh - Diagnose interface, routing, DNS, and socket issues

echo "===== NETWORK INTERFACES (ip addr) ====="
ip addr show

echo -e "\n===== ROUTING TABLE (ip route) ====="
ip route show

echo -e "\n===== DNS RESOLUTION TEST (resolv.conf + ping) ====="
echo "Configured DNS servers:"
cat /etc/resolv.conf | grep nameserver

echo -e "\nTesting DNS resolution..."
ping -c 2 google.com &>/dev/null && echo "✅ DNS resolution OK" || echo "❌ DNS resolution FAILED"

echo -e "\n===== ACTIVE LISTENING PORTS (ss -tuln) ====="
ss -tuln

echo -e "\n===== ESTABLISHED CONNECTIONS ====="
ss -tun state established

echo -e "\n===== INTERFACE STATS (ip -s link) ====="
ip -s link
