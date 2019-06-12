echo "L'id de votre machine : "
echo "1 - MDM Bramet - Bron"
echo "2 - MDM Fontaine-sur-Saône"
echo "3 - MDM Jean Jaurès - Vaulx-en-Velin"
read id

echo $id

echo $id > $HOME/id.txt



# https://www.golinuxcloud.com/create-schedule-cron-job-shell-script-linux/


# Setup ip sender
cp scripts/sendIp.sh $HOME
touch $HOME/ip.txt

touch /etc/cron.d/interpretable
echo "* * * * * sh $HOME/sendIp.sh" >> /etc/cron.d/interpretable

#Setup listenner
git clone https://github.com/interpretable/feather_code.git

cp feather_code/shutdown_listener.py $HOME
echo "@reboot $HOME/shutdownListenner.py" >> /etc/cron.d/interpretable

rm -r feather_code

echo "CRON TASKS INSTALLED"