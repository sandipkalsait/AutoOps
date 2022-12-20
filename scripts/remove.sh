#!/usr/bin/env bash

source ./config/config.shlib;

# echo "Start Archive ..."
path="$(config_get FILE_PATH)"
# home="$(config_get HOME_PATH)"
ext="$(config_get LOG_FILE_EXT)"

AGE_OF_LOG_FILE="$(config_get AGE_OF_LOG_FILE)"
AGE_OF_ARCHIVE_FILE="$(config_get AGE_OF_ARCHIVE_FILE)"


echo $AGE_OF_ARCHIVE_FILE
echo $AGE_OF_LOG_FILE


echo "remove file log files"

#find $path -type f -mmin +$AGE_OF_FILE -name "*.$ext" -exec rm -rf {} \;
pwd
#delete all log files older than $AGE_OF_LOG_FILE  days
find $(pwd)$path -type f -mtime +$AGE_OF_LOG_FILE -name "*.$ext" -exec rm -rf {} \;

#delete all archive files older than $AGE_OF_ARCHIVE_FILE  days
find $(pwd)$path -type f -mtime +$AGE_OF_ARCHIVE_FILE -name "*.tar" -exec rm -rf {} \;


