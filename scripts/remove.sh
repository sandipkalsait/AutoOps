#!/usr/bin/env bash

source ./config/config.shlib

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration variables
paths="$(config_get FILE_PATHS)"
log_name="$(config_get LOG_FILE_NAME)"
arch_name="$(config_get ARCHIVE_FILE_NAME)"
AGE_OF_LOG_FILE="$(config_get AGE_OF_LOG_FILE)"
AGE_OF_ARCHIVE_FILE="$(config_get AGE_OF_ARCHIVE_FILE)"

# Print configuration values
echo -e "${YELLOW}Log file age threshold: ${AGE_OF_LOG_FILE} days${NC}"
echo -e "${YELLOW}Archive file age threshold: ${AGE_OF_ARCHIVE_FILE} days${NC}"

# Convert paths to array
IFS=' ' read -r -a FILE_PATHS <<< "$paths"

# Check length of the path array
pathArrayLength=${#FILE_PATHS[@]}

# Start log file deletion
echo -e "${GREEN}Starting log file deletion...${NC}"
for ((i=0; i<${pathArrayLength}; i++)); do
    current_path=$(pwd)${FILE_PATHS[$i]}
    
    # Delete all log files older than $AGE_OF_LOG_FILE days
    find "$current_path" -type f -mtime +$AGE_OF_LOG_FILE -name "$log_name*" -exec rm -rf {} \;
    echo -e "${GREEN}Removed log files in path: ${current_path}${NC}"
    
    # Delete all archive files older than $AGE_OF_ARCHIVE_FILE days
    find "$current_path" -type f -mtime +$AGE_OF_ARCHIVE_FILE -name "$arch_name*" -exec rm -rf {} \;
    echo -e "${GREEN}Removed archive files in path: ${current_path}${NC}"
done

echo -e "${GREEN}Log file deletion completed.${NC}"
