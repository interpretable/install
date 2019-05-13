#!/bin/sh

echo 'créer une bdd correspondant aux infos de api.env'

sudo mysql -Bse "CREATE USER 'interpretable'@'localhost' IDENTIFIED BY 'erasme';"
sudo mysql -Bse "CREATE DATABASE interpretable;"
sudo mysql -Bse "GRANT ALL PRIVILEGES ON interpretable.* TO 'interpretable'@'localhost';"

cd /var/www/html/

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
sudo chown -R $USER:www-data interpretabble-api/storage interpretabble-api/bootstrap/cache
sudo chown -R $USER:www-data interpretabble-front/storage interpretabble-front/bootstrap/cache
chmod -R 775 interpretabble-api/storage interpretabble-front/storage
chmod -R 775 interpretabble-api/bootstrap/cache interpretabble-front/bootstrap/cache


cp "$currentPath"/api.env interpretabble-api
cd interpretabble-api
cp api.env .env
rm api.env
composer update
php artisan key:generate
php artisan migrate
php composer dump-autoload
php artisan db:seed
cd ..

cp "$currentPath"/front.env interpretabble-front
cd interpretabble-front
cp front.env .env
rm front.env
composer update
php artisan key:generate
#npm install
