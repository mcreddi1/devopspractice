#!/bin/bash

source_dir=$1
destination_dir=$2
days=${3:-14}  #if $3 is empty then take 14 as default
usage(){

    echo -e "usage: sh scriptname.sh <source> <destination> <days(optional)>"
}
#check source a d destination are provided

if [ $# -lt 2 ]
then
     usage
fi

if [ ! -d $source_dir ]
then
     echo "$source_dir not exists"
fi

if [ ! -d $destination_dir ]
then
    echo "$destination_dir not exists"
fi

files=$(find $source_dir -name "*.log" -mtime $days )

#-mtime n: Finds files that were last modified exactly n days ago.
#-mtime +n: Finds files that were last modified more than n days ago.
#-mtime -n: Finds files that were last modified less than n days ago.


echo "Files: $files"

if [ ! -z "$files" ]
then
    echo "files:  are found $files"
else
    echo "no files older than $days"
fi