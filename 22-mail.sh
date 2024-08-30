#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5


while IFS= read -r line 
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print -6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION exceeds $DISK_THRESHOLD, current value: $USAGE"
    fi
done <<< $DISK_USAGE

#while IFS= read -r line #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
#do
#    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
#    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
#    if [ $USAGE -ge $DISK_THRESHOLD ]
#    then
#        echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
#    fi
#done <<< $DISK_USAGE