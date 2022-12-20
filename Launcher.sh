#!/usr/bin/env bash
source ./config/config.shlib; # load the config library functions
   
    # echo "$(config_get myvar)"; # will be found in user-cfg
    # printf -- "%s\n" "$(config_get myvar)"; # safer way of echoing!
    # myvar="$(config_get myvar)"; # how to just read a value without echoing
    # echo "$(config_get othervar)"; # will fall back to defaults
    # echo "$(config_get bleh)"; # "__UNDEFINED__" since it isn't set anywhere

#fetch configration
DAY="$(config_get DAY)"
TIME="$(config_get E_TIME)"
E_TIME=$(date -d "$TIME" "+%s")


#Fetch ALL Script Files
scripts=("$(config_get Scripts)")


echo  "Launcher Script has been Started on $(date) ..."

while true;
do

        C_DAY=$(date "+%u")
        # echo $C_DAY
        if [[ "$C_DAY" = "$DAY" ]];
        then 
           
           Current_epoch=$(date "+%s")
           
           #    Current_epoch=$(date -d "00:00:00" "+%s")
           start_day=$(date -d "00:00:00" "+%s")
           if [[ "$start_day" = "$Current_epoch" ]];
           then 
                    # echo "before sleep "
                    # echo $before_sleep
                    sleep  $before_sleep

           
           Current_epoch=$(date "+%s")
           elif [[ "$Current_epoch" = "$E_TIME" ]];
           then 
                    #echo $Current_epoch
                     echo "Execution started  ..."
                    #READ ALL Script Files
                    read -a scripts_arr <<< $scripts
                    # echo ${scripts_arr[@]}
                    count=${#scripts_arr[@]}
                    pwd
                    # echo $count
                    for (( i=0; i<${count}; i++))
                    do
                        bash ./scripts/${scripts_arr[$i]}
                        sleep 10
                    done
                    echo "Execution ended  ..."

            Current_epoch=$(date "+%s")
            elif [[ "$Current_epoch" > "$E_TIME" ]];
            then
            
                    Current_epoch=$(date "+%s");
                    
                    # echo $Current_epoch;
                    # echo $E_TIME;
                    end_day=$(date -d "23:59:59" "+%s")
                    # echo $end_day;
                    sleep_sec=$(( "$end_day" - "$E_TIME" ))
                    # echo "after sleep "
                    sleep  $sleep_sec 
                    
            
            fi
                      
            


        else 
            C_DAY=$(date "+%u")
            sleep_for_days=$(( "$(config_get MAX_DAY)" - "$C_DAY" ))"d"
            #echo "$(config_get MAX_DAY)"
            # echo "sleep for $sleep_for_days days"
            sleep $sleep_for_days

        fi
done






