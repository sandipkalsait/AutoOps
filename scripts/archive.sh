#!/usr/bin/env bash
source ./config/config.shlib;

# echo "Start Archive ..."
paths="$(config_get FILE_PATHS)"
# home="$(config_get HOME_PATH)"
ext="$(config_get ARCHIVE_FILE_EXT)"


declare -a FILE_PATHS

#Get all files orlder than x days

for path in $paths
do
    FILE_PATHS=(${FILE_PATHS[*]} "$path")
done




declare -a FILES

#Get all files orlder than x days

for file in $(find .$path -type f -name "*.$ext")
do
    FILES=(${FILES[*]} "$file")
done


#check length of an path array
pathArrayLength=${#FILE_PATHS[@]}

#check length of an file array
fileArrayLength=${#FILES[@]}

# echo "Start Archive ..."
for ((i=0;i<${pathArrayLength};i++))
do
    #check 
    #echo ${FILE_PATHS[$i]}

    for ((j=0; j<${fileArrayLength}; j++))
    do
    tar -uvf .${FILE_PATHS[$i]}"/log_$(date "+%d-%m-%Y")".tar  ${FILES[$j]}
    # echo "tar -uvf .${FILE_PATHS[$i]}"/log_$(date "+%d-%m-%Y")".tar ${FILES[$j]}"
    sleep 5 
    done

done

# echo "Archive process end ..."





# echo "End Archive ..."




