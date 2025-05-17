# 🚀 LAMP Stack Auto Deployment Script (CentOS 9)

This Bash script automates the deployment of a LAMP (Linux, Apache, MariaDB, PHP) stack on CentOS 9. It installs and configures Apache, MariaDB, PHP, and deploys a test PHP page.

## 🛠️ Features

- Apache, MariaDB, PHP installation
- MySQL root password set
- Services enabled and started
- PHP test page deployed to `/var/www/html/info.php`

## 📦 Usage

```bash
chmod +x lamp_auto_deploy.sh
sudo ./lamp_auto_deploy.sh

