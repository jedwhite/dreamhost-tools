#!/bin/bash

# Purpose: Backup wordpress directory to tar.gz and database to gz then upload to S3/DreamObjects
# Created: 2016-05-04
# Author: Jed White
# Version: 1.0

# Website information
SITENAME="website"
S3BUCKET="bucketname"

# Setup
TIME=`date +%Y-%m-%d`
SITE="${SITENAME//./_}"
FILENAME="${SITE}_files_backup-$TIME.tar.gz"
DBFILE="${SITE}_wp_backup_$TIME.sql"
DBARCHIVE=${DBFILE}.gz
CURRENTPATH="$PWD"
SRCDIR=~/${SITENAME}
DESDIR=~/backups

# Endpoint required for DreamObjects
S3ENDPOINT="--endpoint-url http://objects.dreamhost.com"
S3DESTINATION="s3://${S3BUCKET}/${SITE}"

# Create backup files
tar -cpzf $DESDIR/$FILENAME $SRCDIR
cd $SRCDIR
wp db export $DESDIR/$DBFILE
gzip $DESDIR/$DBFILE

# Upload to AWS
aws $S3ENDPOINT s3 cp $DESDIR/$FILENAME $S3DESTINATION
aws $S3ENDPOINT s3 cp $DESDIR/$DBARCHIVE $S3DESTINATION

# Cleanup
rm -f $DESDIR/$FILENAME
rm -f $DESDIR/$DBARCHIVE

cd "$CURRENTPATH"
