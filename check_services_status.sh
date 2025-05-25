#!/bin/bash
# check_services_status.sh - Diagnose failed, inactive, and enabled systemd services

echo "===== SYSTEMD FAILED SERVICES ====="
sudo systemctl --failed

echo -e "\n===== INACTIVE BUT NOT DISABLED SERVICES ====="
sudo systemctl list-units --type=service --state=inactive | grep -v "disabled" || echo "✅ All inactive services are disabled."

echo -e "\n===== ENABLED SERVICES SET TO START ON BOOT ====="
sudo systemctl list-unit-files --type=service | grep enabled

echo -e "\n===== TOP 10 LONGEST RUNNING SERVICES ====="
systemctl list-units --type=service --no-pager --no-legend | awk '{print $1}' | \
xargs -n1 -I{} systemctl show -p Id,ActiveEnterTimestampMonotonic {} 2>/dev/null | \
grep -E 'Id=|ActiveEnterTimestampMonotonic=' | \
paste - - | \
sort -k2 -nr | head -n 10 | cut -d= -f2

echo -e "\n===== SYSTEM BOOT LOGS (LAST 3 BOOTS) ====="
journalctl --list-boots | head -n 3
