#!/usr/bin/env bash
source ./config/config.shlib

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Start Archive ...${NC}"

paths="$(config_get FILE_PATHS)"
ext="$(config_get ARCHIVE_FILE_EXT)"

declare -a FILE_PATHS

# Populate FILE_PATHS array
for path in $paths; do
    FILE_PATHS+=("$path")
done

declare -a FILES

# Populate FILES array
for path in "${FILE_PATHS[@]}"; do
    for file in $(find "$path" -type f -name "*.$ext"); do
        FILES+=("$file")
    done
done

# Check length of the arrays
pathArrayLength=${#FILE_PATHS[@]}
fileArrayLength=${#FILES[@]}

if [ $pathArrayLength -eq 0 ]; then
    echo -e "${RED}No paths found to archive.${NC}"
    exit 1
fi

if [ $fileArrayLength -eq 0 ]; then
    echo -e "${YELLOW}No files found to archive.${NC}"
    exit 1
fi

# Archive files
for ((i=0; i<pathArrayLength; i++)); do
    for ((j=0; j<fileArrayLength; j++)); do
        tar -uvf "${FILE_PATHS[$i]}/log_$(date "+%d-%m-%Y").tar" "${FILES[$j]}"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Archived: ${FILES[$j]}${NC}"
        else
            echo -e "${RED}Failed to archive: ${FILES[$j]}${NC}"
        fi
        sleep 5
    done
done

echo -e "${GREEN}Archive process end ...${NC}"
