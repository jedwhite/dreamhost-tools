# dreamhost-tools
Tools for managing DreamHost hosting


## Wordpress Backup to DreamObjects

Script name: wordpress-backup.sh

Backs up Wordpress to DreamObjects bucket from a Dreamhost VPS:
* Wordpress Files directory
* Wordpress Database

Requirements:

* Dreamhost VPS
* WP-CLI: wp
* AWS Command Line tools: awscli

Runs as a bash shell script designed to be called from a cron job

Set the following variables to use:

SITENAME="website.com"
S3BUCKET="bucketname"

The SITENAME variable should match the name of the path where wordpress is installed.

Make sure the script is executable:
chmod +x wordpress-backup.sh


