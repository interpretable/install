#!/bin/sh



# Disable update routines
echo "-----------------------------------DISABLE UPDATES ROUTINES"
sudo systemctl stop apt-daily.timer
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily.service
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service

# Disbale lock screen and black screen
echo "-----------------------------------DISABLE LOCKSCREEN /  BLACK SCREEN"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Shutdowns the nuke after 1 minute
gsettings set org.gnome.settings-daemon.plugins.power button-power "poweroff"
gsettings set org.gnome.SessionManager logout-prompt false



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
echo "VPN certificate setup (put your certificate files in the folder config/vpn )"
echo "Push Enter when finished"
read ok

cp config/vpn/* /etc/openvpn/
sudo systemctl enable openvpn@erasme
sudo systemctl start openvpn@erasme
