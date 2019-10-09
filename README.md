# Interpretable installer

For testing 

sudo docker run -ti --rm --name interpretable -p 80:8000  -v /var/www/interpretable/install/mount:/root ubuntu

## Requirements

The installer has been tested on a Ubuntu 18.04 fresh install
**A stable internet connection is needed**

## PC configuration
Enter in the setup menu by pressing F2 while powering on the NUC. 
To allow the Wake On LAN : 
Click on **Advanced** then **Power**. For "Wake On LAN from S4/S5" choose **Power on, normal boot**. 

To allow the HDMI-CEC : 
Click on **Devices** then **Onboard devices**. Configurate as the following : 
- HDMI CEC : checked 
- TV HDMI port : HDMI 1
- Wake on TV : From S3/S4/S5
- Auto turn on TV : from S3/S4/S5 boot
- Auto turn off TV : when S0 to S3/S4/S5

Finally, press F10 to save and exit. 

## File Structure
The sh files are separeted as follows :
install.sh > installs the main LAMP libraries and vhosts
start_dev.sh > installs creates

## API and BO installation
Before doing anything with the terminal, please open the file scripts/openframework.sh and change the open version version to have the latest one. You can find it here : https://openframeworks.cc/ci_server/versions/nightly/. Be careful : you have to change it four times in that file. 

to install the API and BO just launch the install.sh file
> sudo sh install.sh

When arriving on the mysql secure installation screen choose:

 - setup the validate password plugin **NO**
 - your mysql password 
 - Remove anonymous users **YES**
 - Disallow root login remotely **YES**
 - Remove the test database **YES**
 - Reload privilege table **YES**


## VPN Setup
For experimentation purpose a VPN is used to access to the machines (ssh and monitoring)

>VPN certificate setup (put your certificate files in the folder config/vpn )
>Push Enter when finished

Files types you need to put in config/vpn
- .conf 
- .crt
- .key

If you do not need a VPN, just pus enter. Otherwise, you need to ask to your network engineer these files. 

## Open Frameworks installation

 - Your system is not updated the can create problems when installing the OF dependencies . Do you want to update all the package now **YES**
 - instaling the dependencies with the -hwe-18.04 packages confirm **NO**
 - Do you want to continue **YES**
 - Do you need to install poco libraries in the system with the following package libpoco-dev **YES**

You may have an error here. Indeed, the openFramework.sh script calls a dated version of open framework. If there is a new version, the script will return an error. So you must change the command : 
curl https://openframeworks.cc/ci_server/versions/nightly/of_v20190324_linux64gcc6_nightly.tar.gz --insecure -O
with the latest version of open framework (that can be found here : https://openframeworks.cc/ci_server/versions/nightly/). 
## When installation finished

### Intepretable oF autostart
On the ubuntu GUI go in apps/applications on startup ("Applications au démarrage") 
Clic on the Add button a promt should open 
=> Type "Interpretable" in Name
=> Select the run-interpretable.sh file In Document
=> Clic on add




### Installation details

The installer will :
- **System behavior :**
    - Disable updates routines
    - Disable Lockscreen / black screen
    - Setup the shutdown listenner
    - Setup the vpn 
- **API and FRONT**
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
- **openFrameworks**
    - Download and Compile Open Frameworks
    - Install the needed oF addons
    - Download and compile openCv
    - Download and Compile the intepretable project



## Feather Setup for shutdown and wake up lan
https://github.com/interpretable/feather_code


## Front installation

## Phone use as a 4G key with Automate
The goal of the Automate flowchart is to preserve the phone's battery. 
The phone is connected to the machine with an USB cable. If the PC is off, the flight mode is activated. Otherwise, the flight mode is desactivated and the connection sharing througt USB is allowed. 
You just have to install the mobile app *Automate* on a rooted phone (https://www.kingoapp.com/). Then, download on the phone the .flo file, open the app, add the flowchart from the file and press start. 

This is an image of the flowchart : 
![alt text][logo]

[logo]: https://github.com/interpretable/install/blob/master/Test%20hotspot%20interpretable.png "Automate flowchart"

## Use 
When Interpretable is launched, two options are available : 
-> press "D" : debug function. Show the camera view and logs. You also can use it to setup the detection area by pressing "W"
-> press "W" : setup the detection area (ie the wrapping video) 

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

> sudo systemctl restart interpretable.service

If problem persists try to check the logs with

> sudo systemctl status interpretable.service

