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

* SITENAME="website.com"
* S3BUCKET="bucketname"

The SITENAME variable should match the name of the directory where wordpress is installed.

Make sure the script is executable:
chmod +x wordpress-backup.sh


## Reverse Proxy Cache nginx conf

This is a useful conf to provide reverse proxy with caching for a S3 or DreamObjects bucket.

It runs well on a micro cloud compute instance:

* Reverse caching proxy for DreamObjects or Amazon S3 bucket with CloudFlare etc
* Works with partial content videos to cache on Cloudfront
* Prevents hotlinking to bucket content.

To use:

* Update with bucket URL.
* Replace example.com entries with websites that are allowed to include content.
* Use "nginx service reload" after changes.

There is a good general resource here:

https://www.howtoforge.com/tutorial/how-to-install-nginx-as-reverse-proxy-for-apache-on-ubuntu-15-10/