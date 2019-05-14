# Get Current Path
currentPath="$PWD"

# Install a LAMP Server
sudo apt -y remove apache2
sudo ufw deny “Apache Full”
sudo apt -y remove php libapache2-mod-php php-mbstring php-xmlrpc php-soap php-mysql php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear
sudo apt -y remove mysql-server
sudo apt -y remove git curl


# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo rm -r /usr/local/bin/composer
sudo rm -r /$USER/.composer

sudo rm -r /var/www/html
sudo rm /etc/apache2/sites-available/interpretable.conf



echo 'http://localhost/front/public/scenarios'
