#!/bin/bash

CONFIG_FILE="./config.cfg"
LOG_FILE="./logs/monitor.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Load config
source "$CONFIG_FILE"

log_alert() {
    echo "[$DATE] $1" >> "$LOG_FILE"
}

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    log_alert "High CPU usage: ${CPU_USAGE}%"
fi

# Memory Usage
MEM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    log_alert "High Memory usage: ${MEM_USAGE}%"
fi

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log_alert "High Disk usage: ${DISK_USAGE}%"
fi

# Network (optional)
if command -v ifstat &> /dev/null; then
    NET_USAGE=$(ifstat -i eth0 0.1 1 | awk 'NR==3 {print $1}' | cut -d. -f1)
    if [ "$NET_USAGE" -gt "$NET_THRESHOLD" ]; then
        log_alert "High Network usage: ${NET_USAGE} KB/s (eth0)"
    fi
else
    log_alert "ifstat not installed: Skipping network check"
fi

