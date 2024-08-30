#!/bin/bash

source_dir=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $source_dir ]
then

     echo  -e "$source_dir $G exists $N"
else
     echo -e "$source_dir $R not exists $N"
     exit 1
fi

log_files=$(find $source_dir -name "*.log" -mtime +14)
echo "files: $log_files"

while IFS= read -r files #IFS: internal field separator empty it will ignore the space, -r is to not ignore special characters like /
do
  echo "deleting files: $log_files"
  rm -rf $done <<< $log_files
done <<< $log_files