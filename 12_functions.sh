#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo "please run the script with root access"
    exit 1
 fi   
}

VALIDATE(){
    if ( $1 -ne 0 )
    then
    echo "$2 is failed"
    exit 1
else
    echo "$2 is success"
    fi
}

CHECK_ROOT

dnf list installed git

if ( $? -ne 0 )

    then 
    echo "git is not installed, going to install"

    dnf install git -y
    VALIDATE $? "istalling git"
else
    echo "git is already installed"
fi

dnf list installed mysqld

if ( $? -ne 0 )

    then 
    echo "mysql is not installed"

    dnf install mysqld -y
    VALIDATE $? "installing mysqld"

else
    echo  "installing mysql"

fi


