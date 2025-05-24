#!/bin/bash
# check_cpu_usage.sh - Diagnose CPU usage and load issues

echo "===== CPU USAGE (top 10 processes) ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11

echo -e "\n===== CPU CORE STATS ====="
if command -v mpstat &>/dev/null; then
    mpstat -P ALL 1 1
else
    echo "⚠️ mpstat not installed. Install with: sudo apt install sysstat"
fi

echo -e "\n===== LOAD AVERAGE ====="
uptime
