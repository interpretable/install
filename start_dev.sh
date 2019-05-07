#!/bin/sh

echo 'créer une bdd correspondant aux infos de api.env'

git clone https://github.com/urbanlab/interpretabble-api.git
git clone https://github.com/urbanlab/interpretabble-front.git

cd interpretabble-api
git checkout dev
cd ..

cd interpretabble-front
git checkout dev
cd ..

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
