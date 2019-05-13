#!/bin/sh

echo 'créer une bdd correspondant aux infos de api.env'

sudo mysql -Bse "CREATE USER 'interpretable'@'localhost' IDENTIFIED BY 'erasme';"
sudo mysql -Bse "CREATE DATABASE interpretable;"
sudo mysql -Bse "GRANT ALL PRIVILEGES ON interpretable.* TO 'interpretable'@'localhost';"


# get the api and Bo from github
git clone https://github.com/urbanlab/interpretabble-api.git
git clone https://github.com/urbanlab/interpretabble-front.git

cd interpretabble-api
git checkout dev
cd ..

cd interpretabble-front
git checkout dev
cd ..


# Sets acces permission
sudo chown -R www-data:www-data /interpretabble-api 
sudo usermod -a -G www-data ubuntu
sudo find /interpretabble-api -type f -exec chmod 644 {} \; 
sudo find /interpretabble-api  -type d -exec chmod 755 {} \;
sudo chown -R interpretable:www-data /interpretabble-api 

sudo find /interpretabble-api -type f -exec chmod 664 {} \;    
sudo find /interpretabble-api  -type d -exec chmod 775 {} \;


cp api.env interpretabble-api
cd interpretabble-api
cp api.env .env
rm api.env
composer update
php artisan key:generate
php artisan migrate
php composer dump-autoload
php artisan db:seed
cd ..

cp front.env interpretabble-front
cd interpretabble-front
cp front.env .env
rm front.env
composer update
php artisan key:generate
npm install
