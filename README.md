# Interpretable installer

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

## Front installation