# 🛠️ Linux Troubleshooting Toolkit

A modular, extensible, and production-ready toolkit for diagnosing Linux systems, built for system administrators, DevOps, and DevSecOps engineers.

> Created to speed up debugging of Linux servers under high load, strange behavior, or outage conditions — with a focus on safe, readable, and practical commands.

---

## 📦 Project Structure

Each script is standalone and scoped to a specific system layer:

check_disk_usage.sh      -->	Show disk space, largest files, inode usage
check_cpu_usage.sh       -->	Top CPU processes, load average, per-core stats
check_memory_usage.sh    -->	RAM/swap status, top memory processes, vmstat snapshot
check_io_usage.sh        -->	Disk I/O load with iotop, iostat
check_network_status.sh  -->	Network interface, routing, listening ports, ping test
check_services_status.sh -->	Shows failed services and key service status (e.g., nginx, sshd, etc.)
check_system_logs.sh	 -->    Parses logs for errors, boots, kernel issues
master_diagnose.sh	 -->    Aggregates all scripts for full system health report
