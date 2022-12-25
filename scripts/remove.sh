#!/usr/bin/env bash

source ./config/config.shlib;


paths="$(config_get FILE_PATHS)"

log_name="$(config_get LOG_FILE_NAME)"

arch_name="$(config_get ARCHIVE_FILE_NAME)" 

AGE_OF_LOG_FILE="$(config_get AGE_OF_LOG_FILE)"

AGE_OF_ARCHIVE_FILE="$(config_get AGE_OF_ARCHIVE_FILE)"


echo $AGE_OF_ARCHIVE_FILE
echo $AGE_OF_LOG_FILE

declare -a FILE_PATHS

for path in $paths
do
    FILE_PATHS=(${FILE_PATHS[*]} "$path")
done


#check length of an path array
pathArrayLength=${#FILE_PATHS[@]}

# echo "Start log file deletion ..."
for ((i=0;i<${pathArrayLength};i++))
do
            #check 
            #echo ${FILE_PATHS[$i]}

            #find $path -type f -mmin +$AGE_OF_FILE -name "*.$ext" -exec rm -rf {} \;
            
            #pwd

            #delete all log files older than $AGE_OF_LOG_FILE  days
            find $(pwd)${FILE_PATHS[$i]} -type f -mtime +$AGE_OF_LOG_FILE -name "$log_name*" -exec rm -rf {} \;

            #delete all archive files older than $AGE_OF_ARCHIVE_FILE  days
            find $(pwd)${FILE_PATHS[$i]} -type f -mtime +$AGE_OF_ARCHIVE_FILE -name "$arch_name*" -exec rm -rf {} \;

            echo "removed file log files in path : ${FILE_PATHS[$i]}"

done
# echo "Start Archive ..."