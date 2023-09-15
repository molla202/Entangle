#!/bin/sh

FILE_NAME=backup_data.tar.gz
DATA_FOLDER=$HOME/.entangled/data

# remove and recreate data folder
rm -rf $DATA_FOLDER
mkdir -p $DATA_FOLDER

# download archive
curl -L -o $FILE_NAME https://entangle-public.s3.amazonaws.com/$FILE_NAME

# unpack archive to data folder
# chmod -x $FILE_NAME
tar -xzvf $FILE_NAME -C $DATA_FOLDER

# remove archive
# rm $FILE_NAME
