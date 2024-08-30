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