#!/bin/sh

# Get Current Path
currentPath="$PWD"

# Install a LAMP Server
echo "-----------------------------------INSTALL LAMP SERVER"
apt-get update
sudo apt -y install apache2
sudo ufw allow “Apache Full”
sudo apt -y install php libapache2-mod-php php-mbstring php-xmlrpc php-soap php-mysql php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear
sudo apt -y install mysql-server
sudo apt -y install git curl
sudo mysql_secure_installation

# Install Composer
echo "-----------------------------------INSTALL COMPOSER"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

sudo rm /var/www/html/index.html

#install SSH
echo "-----------------------------------INSTALL SSH"
sudo apt -y install openssh-server

#Install python for feather shutdown
echo "-----------------------------------INSTALL PYTHON"
sudo apt-get -y install python3.6 

# Install open vpn certificate manager
echo "-----------------------------------INSTALL OPEN VPN"
sudo apt-get -y install network-manager-openvpn

# Disable auto upgrade to save 4g data



echo 'LAMP SERVER INSTALLED'
