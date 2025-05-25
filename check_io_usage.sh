#!/bin/bash
# check_io_usage.sh - Diagnose disk I/O load using iotop, iostat, and vmstat

echo "===== DISK I/O USING IOSTAT ====="
if command -v iostat &>/dev/null; then
    iostat -xz 1 3
else
    echo "⚠️ iostat not installed. Install with: sudo apt install sysstat"
fi

echo -e "\n===== DISK I/O USING IOTOP (Live Top) ====="
if command -v iotop &>/dev/null; then
    echo "Showing top 10 I/O processes for 5 seconds..."
    sudo iotop -b -n 5 -d 1 | head -n 30
else
    echo "⚠️ iotop not installed. Install with: sudo apt install iotop"
fi

echo -e "\n===== IO SNAPSHOT WITH VMSTAT ====="
if command -v vmstat &>/dev/null; then
    vmstat 1 3
else
    echo "⚠️ vmstat not installed. Install with: sudo apt install procps"
fi
