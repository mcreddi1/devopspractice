#!/bin/bash

source_dir=$1
destination_dir=$2
days=${3:-14}  #if $3 is empty then take 14 as default
TIMESTAMP=$(date +%y%m%d)
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
# if we give -5 days , then it will look for the files which were created within these 5 days
# if we give +5 days , then it will look for the files which were created beyond these 5 days

echo "Files: $files"  

if [ ! -z "$files" ]
then
    echo "files:  are found"
else
    echo "no files older than $days"
    exit 1
fi

zip_file="$destination_dir/$TIMESTAMP.zip"
find {$source_dir} -name "*.log" -mtime $days | zip "$zip_file" -@

if [ -f $zip_file ]
then
    echo "successfully zipped files older than $days"
else
    echo "zipping failed"
    exit 1
fi

while IFS= read -r file #IFS: internal field separator empty it will ignore the space, -r is to not ignore special characters like /
do
  echo "deleting line: $files"
  #rm -rf $files
done <<< $files