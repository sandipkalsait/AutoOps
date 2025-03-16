#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Define the script ID
SCRIPT_ID="main.sh"
PID_FILE="launcher.pid"

start() {
    # Run the script with nohup and redirect output to launcher.log
    nohup ./$SCRIPT_ID > launcher.log 2>&1 &
    
    # Get the process ID of the last command run in the background
    PID=$!
    
    # Save the process ID to a locked file
    if echo $PID > $PID_FILE && chmod 400 $PID_FILE; then
        echo -e "${GREEN}Launcher started successfully with PID $PID. Output is being logged to launcher.log.${NC}"
    else
        echo -e "${RED}Failed to start the launcher.${NC}"
    fi
}

stop() {
    if [ -f $PID_FILE ]; then
        PID=$(cat $PID_FILE)
        if kill $PID > /dev/null 2>&1; then
            echo -e "${GREEN}Launcher stopped successfully.${NC}"
            rm -f $PID_FILE
        else
            echo -e "${RED}Failed to stop the launcher.${NC}"
        fi
    else
        echo -e "${RED}PID file not found. Is the launcher running?${NC}"
    fi
}

case "$1" in
    start)
        start
        ;;
    stop|kill|terminate)
        stop
        ;;
    *)
        echo -e "${RED}Usage: $0 {start|stop|kill|terminate}${NC}"
        exit 1
        ;;
esac