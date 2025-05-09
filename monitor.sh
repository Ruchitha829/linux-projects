#!/bin/bash

echo "----------------------------"
echo "System Monitoring Script"
echo "----------------------------"

# Date & Time
echo "Date & Time : $(date)"
echo ""

# Uptime
echo "System Uptime:"
uptime
echo ""

# CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)"
echo ""

# Memory Usage
echo "Memory Usage:"
free -h
echo ""

# Disk Usage
echo "Disk Usage:"
df -h
echo ""

