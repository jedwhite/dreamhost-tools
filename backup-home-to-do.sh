#!/bin/bash
#Purpose = Backup wordpress directory to tar.gz and database to gz then upload to S3/DreamObjects
#Created on 2016-05-04
#Author = Jed White
#Version 1.0
#START
TIME=`date +%b-%d-%y`            # Include date in filename
FILENAME=backup-$TIME.tar.gz    # filename format
DBFILE=wp-backup-$TIME.sql
DBARCHIVE=wp-backup-$TIME.sql.gz
SRCDIR=~/website                    # Source directory to backup
DESDIR=~/backup            # Local destination for backup files
S3BUCKET=s3://bucketname/path/            # S3 Bucket to send backup to
S3ENDPOINT="--endpoint-url http://objects.dreamhost.com"            # Endpoint for DreamObjects
CURRENTPATH="$PWD"
tar -cpzf $DESDIR/$FILENAME $SRCDIR
cd $SRCDIR
wp db export $DESDIR/$DBFILE
gzip $DESDIR/$DBFILE
aws $S3ENDPOINT s3 cp $DESDIR/$FILENAME $S3BUCKET
aws $S3ENDPOINT s3 cp $DESDIR/$DBARCHIVE $S3BUCKET
rm -f $DESDIR/$FILENAME
rm -f $DESDIR/$DBARCHIVE
cd "$CURRENTPATH"
#END