#!/bin/bash

source_dir=/var/log

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

files=$(find $source_dir -name "*.log" -mtime +14)
echo "files: $files"

while IFS= read -r file #IFS: internal field separator empty it will ignore the space, -r is to not ignore special characters like /

do

  echo "deleting line: $file"
  rm -rf $file
done <<< $files