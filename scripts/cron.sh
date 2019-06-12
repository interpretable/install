echo "L'id de votre machine : "
echo "1 - MDM Bramet - Bron"
echo "2 - MDM Fontaine-sur-Saône"
echo "3 - MDM Jean Jaurès - Vaulx-en-Velin"
read id

echo $id

echo ' ' >> ~/.bashrc
echo '# Interpretable machine id for monitoring' >> ~/.bashrc
echo "export INTERPRETABLEID=$id" >> ~/.bashrc


# https://www.golinuxcloud.com/create-schedule-cron-job-shell-script-linux/


# Setup ip sender
cp sendIp.sh $HOME
touch $HOME/ip.txt

touch /etc/cron.d/interpretable
echo "* * * * * sh sendIp.sh" >> /etc/cron.d/interpretable


"* * * * * sh senIp.sh"
# * * * * * sh senIp.sh


#Setup listenner
#git clone https://github.com/interpretable/feather_code.git

# cp feather_code/shutdownListenner.py $HOME
# @reboot shutdownListenner.py

 sudo crontab -l  echo '* * * * * sh www/interpretable/install/sendIp.sh' | crontab -