#!/bin/sh

# Used to enable the shutdown script and the default vpn connection

#Setup listenner - A TESTER
git clone https://github.com/interpretable/feather_code.git

cp feather_code/shutdown_listener.py $HOME

sudo cp config/interpretable.service /etc/systemd/system
sudo systemctl enable interpretable.service
sudo systemctl start interpretable.service


#Setup vpn - OK
echo "Mise en place des certifiats openvpn (chargez les fichiers dans le dossier config/vpn)"
echo "Appuyez sur entrée une fois les fichiers placés"
read ok

cp config/vpn/* /etc/openvpn/

