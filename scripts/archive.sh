#!/usr/bin/env bash
source ./config/config.shlib;

# echo "Start Archive ..."
path="$(config_get FILE_PATH)"
# home="$(config_get HOME_PATH)"
ext="$(config_get ARCHIVE_FILE_EXT)"

# echo $ext

$files



declare -a FILES

#Get all files orlder than x days

for file in $(find .$path -type f -name "*.$ext")
do
    FILES=(${FILES[*]} "$file")
done


#check length of an file array
arrayLength=${#FILES[@]}


for ((i=0; i<${arrayLength}; i++))
do
    tar -uvf .$path"/log_$(date "+%d-%m-%Y")".tar  ${FILES[$i]}
    sleep 5 
done



# echo "End Archive ..."




