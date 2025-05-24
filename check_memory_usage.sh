#!/bin/bash
# check_memory_usage.sh - Diagnose memory and swap pressure, top memory processes

echo "===== MEMORY USAGE ====="
free -h

echo -e "\n===== TOP MEMORY CONSUMING PROCESSES ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11

echo -e "\n===== VMSTAT SNAPSHOT ====="
if command -v vmstat &>/dev/null; then
    vmstat 1 3
else
    echo "⚠️ vmstat not installed. Install with: sudo apt install procps"
fi
