#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5


while IFS= read -r line 
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION exceeds $DISK_THRESHOLD, current value: $USAGE"
    fi
done <<< $DISK_USAGE

# Set recipient and email details
recipient="chinnapareddymora@ge.com"
subject="Disk Usage Alert"
body="Disk usage is high. Details:"

# Get disk usage information
disk_usage=$(df -h)

# Append disk usage info to the body
body="$body\n\n$disk_usage"

# Send the email
echo -e "$body" | mail -s "$subject" "$recipient"
