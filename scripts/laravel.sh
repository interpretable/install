#!/bin/sh

# Get Current Path
currentPath="$PWD"

# Enable mod_rewrite
echo "-----------------------------------SETUP VHOST FOR INTERPRETABLE API / FRONT"
sudo a2enmod rewrite
sudo service apache2 restart

#copy apache configuration file
sudo cp "$currentPath"/config/interpretable.conf /etc/apache2/sites-available
sudo a2ensite interpretable.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart



echo "----------------------------------- CREATING DB FOR API"
echo 'créer une bdd correspondant aux infos de api.env'
sudo mysql -Bse "CREATE USER 'interpretable'@'localhost' IDENTIFIED BY 'erasme';"
sudo mysql -Bse "CREATE DATABASE interpretable;"
sudo mysql -Bse "GRANT ALL PRIVILEGES ON interpretable.* TO 'interpretable'@'localhost';"

cd /var/www/html/

# get the api and Bo from github
git clone https://github.com/interpretable/api.git
git clone https://github.com/interpretable/front

# Switch to dev branch
cd api
git checkout dev
cd ..

cd front
git checkout dev
cd ..


# Sets acces permission
sudo chown -R $USER:www-data api/storage api/bootstrap/cache
sudo chown -R $USER:www-data front/storage front/bootstrap/cache
chmod -R 775 api/storage front/storage
chmod -R 775 api/bootstrap/cache front/bootstrap/cache


# Install dependencies and create table/seed in db
cp "$currentPath"/config/api.env api
cd api
cp api.env .env
rm api.env
composer update
php artisan key:generate
php artisan migrate
php composer dump-autoload
php artisan db:seed
cd ..

# Install dependencies 
cp "$currentPath"/config/front.env front
cd front
cp front.env .env
rm front.env
composer update
php artisan key:generate


echo "-----------------------------------API / FRONT INSTALL OK"