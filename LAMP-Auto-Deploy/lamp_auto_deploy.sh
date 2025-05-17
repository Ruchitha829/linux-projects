#!/bin/bash

echo "📦 Updating system..."
sudo dnf update -y

echo "💻 Installing Apache, MariaDB, PHP..."
sudo dnf install -y httpd mariadb-server php php-mysqlnd php-cli php-common

echo "🔄 Starting Apache and MariaDB services..."
sudo systemctl start httpd
sudo systemctl enable httpd

sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "🔐 Securing MariaDB..."

# Check if root password is set by attempting login without password
if mysql -uroot -e "quit" 2>/dev/null; then
  echo "Root password NOT set, setting root password now..."
  sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';"
else
  echo "Root password already set, continuing..."
fi

MYSQL_CMD="mysql -uroot -prootpass"

echo "Removing anonymous users and test databases if present..."
$MYSQL_CMD -e "DELETE FROM mysql.user WHERE User='';"
$MYSQL_CMD -e "DROP DATABASE IF EXISTS test;"
$MYSQL_CMD -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
$MYSQL_CMD -e "FLUSH PRIVILEGES;"

echo "Creating database and user if not exist..."
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS mydb;"
$MYSQL_CMD -e "CREATE USER IF NOT EXISTS 'myuser'@'localhost' IDENTIFIED BY 'mypass';"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'localhost';"
$MYSQL_CMD -e "FLUSH PRIVILEGES;"

echo "📝 Creating test PHP file..."
sudo tee /var/www/html/index.php > /dev/null <<EOF
<?php
\$servername = "localhost";
\$username = "myuser";
\$password = "mypass";
\$dbname = "mydb";

\$conn = new mysqli(\$servername, \$username, \$password, \$dbname);

if (\$conn->connect_error) {
    die("Connection failed: " . \$conn->connect_error);
}
echo "✅ Connected to MariaDB successfully!";
?>
EOF

echo "🔧 Setting permissions..."
sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/

echo "🔄 Restarting Apache..."
sudo systemctl restart httpd

echo "🎉 LAMP stack installed and configured successfully!"
echo "👉 Open your server IP or localhost in browser to test."

