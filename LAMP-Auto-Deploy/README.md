# 🚀 LAMP Stack Auto Deployment Script (CentOS 9)

This Bash script automates the deployment of a LAMP (Linux, Apache, MariaDB, PHP) stack on CentOS 9. It installs and configures Apache, MariaDB, PHP, secures the database, creates a sample database/user, and deploys a test PHP page.

![Platform](https://img.shields.io/badge/platform-CentOS%209-blue)
![Shell](https://img.shields.io/badge/shell-Bash-lightgrey)
![Status](https://img.shields.io/badge/status-Completed-brightgreen)
![License](https://img.shields.io/badge/license-MIT-yellow)

---

## 🛠️ Features

- ✅ Apache, MariaDB, and PHP automated installation
- 🔐 Sets MariaDB (MySQL) root password and secures DB
- 📁 Creates a sample database and user
- 📄 Deploys `info.php` to `/var/www/html/` for LAMP verification
- 🔁 Idempotent: Safe to re-run without breaking things
- ⚙️ Starts and enables services at boot

---

## 📦 Usage

1. **Give script permission** and **run** it:
   ```bash
   chmod +x lamp_auto_deploy.sh
   sudo ./lamp_auto_deploy.sh
