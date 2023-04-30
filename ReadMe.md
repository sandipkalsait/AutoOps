# Script-details :
automated execution of script per week

# Configuration changes
to new config changes do inside of config.cfg
path : config/config.cfg

script will first fetch the all configuration inside the config.cfg
and if there not then it will check in default configuration 

default  configuration 
path : config/config.cfg.defaults 
all the configuration at base lavel

Day of execution : default monday [ DAY (1..7) : 1 is Monday ]
Time of execution : 08:00:00
AGE of log file : 14 
AGE of archive file : 7 
FILE_PATH=/spacelogs





# FILE DELETION 
for each execution it will delete all
log files older than 14 days

and

archived files older than 7 days

# ARCHIVE FILES 
Compress all log files
log files older than 7


# NEW SCRIPT CREATIONS 
place the new script in script folder
and add the script-file name in config.cfg file
restart the launcher script


# How to start script
to start script use following command

nohup bash Log_deletion.sh &

# TO stop script
you need to check the process ID
so
 use following command
 ps

then for 
   script process-id

use following command

kill -9 <process-id>

eg.

kill -9 34833

after than you have to delete
nohup.out file 

that file will contain script logs








