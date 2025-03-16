#!/usr/bin/env bash
source ./config/config.shlib; # load the config library functions

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fetch configuration
DAY="$(config_get DAY)"
TIME="$(config_get E_TIME)"
E_TIME=$(date -d "$TIME" "+%s")

# Fetch ALL Script Files
scripts=("$(config_get Scripts)")

echo -e "${GREEN}Launcher Script has been Started on $(date) ...${NC}"

while true; do
    C_DAY=$(date "+%u")
    if [[ "$C_DAY" = "$DAY" ]]; then
        Current_epoch=$(date "+%s")
        start_day=$(date -d "00:00:00" "+%s")
        if [[ "$start_day" = "$Current_epoch" ]]; then
            sleep $before_sleep
            Current_epoch=$(date "+%s")
        elif [[ "$Current_epoch" = "$E_TIME" ]]; then
            echo -e "${YELLOW}Execution started ...${NC}"
            read -a scripts_arr <<< $scripts
            count=${#scripts_arr[@]}
            for (( i=0; i<${count}; i++)); do
                bash ./scripts/${scripts_arr[$i]}
                sleep 10
            done
            echo -e "${YELLOW}Execution ended ...${NC}"
            Current_epoch=$(date "+%s")
        elif [[ "$Current_epoch" > "$E_TIME" ]]; then
            Current_epoch=$(date "+%s")
            end_day=$(date -d "23:59:59" "+%s")
            sleep_sec=$(( "$end_day" - "$E_TIME" ))
            sleep $sleep_sec
        fi
    else
        C_DAY=$(date "+%u")
        sleep_for_days=$(( "$(config_get MAX_DAY)" - "$C_DAY" ))"d"
        sleep $sleep_for_days
    fi
done
