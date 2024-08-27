#!/bin/bash

LOGS_FOLDER= "/var/log/scripts"
SCRIPT_NAME= $(echo $0 | cut -d "." -f1 )
TIMESTAMP= $(date +%y-%m-%d-%H-%m-%s )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e31m"
G="\e32m"
Y="\e33m"

CHECK_ROOT(){

    if [ $USERID -ne 0 ]

    then 
    echo "Please run the script with root user access"
    exit 1
fi
}

VALIDATE(){

    if [ $1 -ne 0 ]
    then
    echo -e "$2 $R is failed $N" | tee -a $LOG_FILE
    exit 1
    else
    echo -e "$2  $G is success $N" | tee -a $LOG_FILE
    fi

}

USAGE(){

    echo -e "$R sudo sh 16_redirectors.sh pachage1 package2 ..$N"
    exit 1

}

echo "script started running at : $(date)" | tee -a $LOG_FILE


CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed..nothing to do $N" | tee -a $LOG_FILE
    fi
done   