# System Resource Monitor

A bash script that monitors system health: CPU, memory, disk, and network usage, and logs alerts if thresholds are exceeded.

## 🔧 Features
- CPU, RAM, Disk usage monitoring
- Optional Network usage check
- Alerts logged with timestamps
- Easy threshold config
- Cron-friendly

## 📂 Structure
- `monitor.sh`: Main script
- `config.cfg`: User-defined thresholds
- `logs/monitor.log`: Alert logs

## 🚀 Setup

```bash
git clone https://github.com/yourname/system-monitor.git
cd system-monitor
chmod +x monitor.sh

