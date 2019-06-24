# Interpretable installer

For testing 

sudo docker run -ti --rm --name interpretable -p 80:8000  -v /var/www/interpretable/install/mount:/root ubuntu

## File Structure
The sh files are separeted as follows :
install.sh > installs the main LAMP libraries and vhosts
start_dev.sh > installs creates

## API and BO installation

to install the API and BO just launch the install.sh file
> sudo sh install.sh

When arriving on the mysql secure installation screen choose:

 - setup the validate password plugin **NO**
 - your mysql password 
 - Remove anonymous users **YES**
 - Disallow root login remotely **YES**
 - Remove the test database **YES**
 - Reload privilege table **YES**




### Installation details

The installer will :
- Install a **LAMP** server
- Install **Composer**
- Enable the **a2enmod** on apache for url rewriting on Laravel
- Add and activate vhost file for intepretable
- Create the intepretable db and user
- Clone from github the api and front repository
- Give the right permission access on folder/files for currentuser
- Install the api php dependencies with composer 
- Generate the laravel APP_KEY  
- Create the table structure in db
- Seeding the db with the default cards/thematic/machines
- Install the api php dependencies with composer 
- Generate the laravel APP_KEY

## VPN Setup
For experimentation purpose a VPN is used to access to the machines (ssh and monitoring)
### Configuration
Load your openvpn certificat trough Settings -> Networks -> VPN -> Add from file
Once saved open a command prompt and type
> nmcli con
To get the UUID of your VPN
Go to display application (bottom left gnome desktop) and search "app" to Launch **App on startup**
Add a new entry with the command 
> sh -c "sleep 60 && nmcli con up UUID
and saveq


## Feather Setup for shutdown and wake up lan
https://github.com/interpretable/feather_code

TODO
- setup a cron task to launch the feather python shutdown watcher at every boot

## Front installation

## Phone use as a 4G key with Automate
The goal of the Automate flowchart is to preserve the phone's battery. 
The phone is connected to the machine with an USB cable. If the PC is off, the flight mode is activated. Otherwise, the flight mode is desactivated and the connection sharing througt USB is allowed. 
You just have to install the mobile app *Automate* on a rooted phone (https://www.kingoapp.com/). Then, download on the phone the .flo file, open the app, add the flowchart from the file and press start. 

This is an image of the flowchart : 
![alt text][logo]

[logo]: https://github.com/interpretable/install/blob/master/Test%20hotspot%20interpretable.png "Automate flowchart"


## FAQ

### No ip adress is sent to the Monitoring interface (front/public/machines)
In some cases the install script fails to install the cron tasks used to send the ip adress
you can manually add the cron task by lauching a Command prompt 
> crontab -e
Select your favorite text editor
in the bottom of the file add
```cron

* * * * * sh $HOME/sendIp.sh
@reboot python3 $HOME/shutdownListenner.py
```

### I cannot shutdown the machine :/
In some cases the install script fails to install the cron tasks used to launch a runner watching for the udp shutdown message
you can manually add the cron task by lauching a Command prompt 
> crontab -e
Select your favorite text editor
in the bottom of the file add
```cron

* * * * * sh $HOME/sendIp.sh
@reboot python3 $HOME/shutdownListenner.py
```
