#!/bin/sh

# Internet connection check for Huawei E5186 LTE router 
# Linux (none) 2.6.36.4brcmarm & BusyBox v1.7.2 2017

# Adding the script launch to /app/bin/autorun.sh
# to do this, you need to remount /app for recording
# mount -o remount,rw /app
# mount -o remount,ro /app
# You can write to /data/ all the time, you can put your scripts here,

checkTimeout=1800
recheckTimeout=600
ip1="8.8.8.8"
ip2="8.8.4.4"

while true;
do
    sleep $checkTimeout
    if ping -4 -w 5 $ip1 > /dev/null
    then
        :
    else
        sleep $recheckTimeout 
        if ping -4 -w 5 $ip2  > /dev/null
        then
            :
        else
            reboot
        fi
    fi
done
