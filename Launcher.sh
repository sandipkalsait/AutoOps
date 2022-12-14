#!/usr/bin/env bash
source ./config/config.shlib; # load the config library functions
    # echo "$(config_get myvar)"; # will be found in user-cfg
    # printf -- "%s\n" "$(config_get myvar)"; # safer way of echoing!
    # myvar="$(config_get myvar)"; # how to just read a value without echoing
    # echo "$(config_get othervar)"; # will fall back to defaults
    # echo "$(config_get bleh)"; # "__UNDEFINED__" since it isn't set anywhere




DAY=$(config_get DAY)
E_TIME=$(date -d '$DAY' "+%s")

echo  "Launcher Script has been Started ... "

while true;
do

        C_DAY=$(date "+%u")

        if [[ "$C_DAY" = "$DAY" ]];
        then 
           
           Current_epoch=$(date "+%s")
           if [[ "$Current_epoch" = "$E_TIME" ]];
           then
                    #Get ALL Script Files
                    $scripts=$(config_get Scripts)
                    $count=${#script[@]}
                    for (( i=0; i<${count}; i++))
                        echo "bash $(scipts[$i])"
                        sleep 10
                    done
            else
            
            Current_epoch=$(date "+%s")
            sleep_sec=$(( $E_TIME - $current_epoch ))
            echo "sleep $sleep_sec"
            
            
            fi


        else 
            C_DAY=$(date "+%u")
            sleep_for_days=$(( $(config_get MAX_DAY) - $C_DAY))"d"
            echo "sleep $sleep_for_days"

        fi
done





