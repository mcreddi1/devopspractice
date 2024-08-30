#!/bin/bash

disk_usage=$(df -hT | grep xfs)
disc_threshhold=5


while IFS= read -r line 

do
    usage=$(echo $line | grep xfs | awk -F " " '{print -6F}' | cut -d "%" -f1)

    partition=$(echo $line | grep xfs | awk '{print $NF}')

    if [ $usage -ge $disc_threshhold ]
    then
    echo "$partition exceeds $disc_threshhold, current value: $usage"
    fi
done <<< $disk_usage