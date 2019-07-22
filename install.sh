#!/bin/sh
sudo sh scripts/lamp.sh
sudo sh scripts/laravel.sh
sudo sh scripts/autostart.sh
sudo sh scripts/openFrameworks.sh

# Documenter le start interpretable au demarrage
# Les fichier vpn documenter .conf
# sudo apt-get install gstreamer1.0-libav 


# Default BO url
echo 'Front access : http://localhost/front/public/scenarios'

echo "Redemarrez la machine afin de prendre en compte la config de openvpn"