#!/bin/sh



# Disable update routines
echo "-----------------------------------DISABLE UPDATES ROUTINES"
systemctl stop apt-daily.timer
systemctl disable apt-daily.timer
systemctl disable apt-daily.service
systemctl stop apt-daily-upgrade.timer
systemctl disable apt-daily-upgrade.timer
systemctl disable apt-daily-upgrade.service

# Disbale lock screen and black screen
echo "-----------------------------------DISABLE LOCKSCREEN /  BLACK SCREEN"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false



# Used to enable the shutdown script and the default vpn connection

#Setup listenner - A TESTER
echo "----------------------------------- SETUP SHUTDOWN LISTENNER"
git clone https://github.com/interpretable/feather_code.git

cp feather_code/shutdown_listener.py $HOME

sudo cp config/interpretable.service /etc/systemd/system
sudo systemctl enable interpretable.service
sudo systemctl start interpretable.service


#Setup vpn - OK
echo "-----------------------------------SETUP VPN"
echo "Mise en place des certifiats openvpn (chargez les fichiers dans le dossier config/vpn)"
echo "Appuyez sur entrée une fois les fichiers placés"
read ok

cp config/vpn/* /etc/openvpn/
sudo systemctl enable openvpn@erasme
sudo systemctl start openvpn@erasme
