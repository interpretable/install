#!/bin/sh

sudo sh scripts/lamp.sh
sudo sh scripts/laravel.sh
sudo sh scripts/autostart.sh
#sudo sh scripts/cron.sh

# Default BO url
echo 'Front access : http://localhost/front/public/scenarios'

echo "Redemarrez la machine afin de prendre en compte la config de openvpn"