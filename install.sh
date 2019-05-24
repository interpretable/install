# Get Current Path
currentPath="$PWD"

# Install a LAMP Server
apt-get update
sudo apt -y install apache2
sudo ufw allow “Apache Full”
sudo apt -y install php libapache2-mod-php php-mbstring php-xmlrpc php-soap php-mysql php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear
sudo apt -y install mysql-server
sudo apt -y install git curl
sudo mysql_secure_installation

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
#mkdir /var/www/html
cd /var/www/html
sudo rm index.html


# Enable mod_rewrite
sudo a2enmod rewrite
sudo service apache2 restart

#copy apache configuration file
sudo cp "$currentPath"/interpretable.conf /etc/apache2/sites-available
sudo a2ensite interpretable.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart

# Laravel setup
cd "$currentPath"
sudo sh "$currentPath"/start_dev.sh

#remoteit tools
sudo apt -y install openssh-server
sudo systemctl status ssh
#curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
#chmod +x ./auto-install.sh
#sudo ./auto-install.sh
#sudo connectd_installer

#installer PM2

# Default BO url
echo 'http://localhost/front/public/scenarios'
