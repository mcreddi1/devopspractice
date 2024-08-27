#!/bin/bash

USERID=$(id -u)

echo "User id is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run the script with root access"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]

then
    
echo "git is not installed going to install it"
dnf install git -y

    if [ $? -ne 0 ]
    then 
    echo "installing git is not successful"
    exit 1

    else

    
    echo "git installatio is successful"
    fi

else

echo "git is already installed nothing todo"
fi



dnf list installed mysql

if [ $? -ne 0 ]

then

echo "mysql is not installed, going to install it"
dnf install mysql -y

    if [ $? -ne 0 ]
    then
    echo "mysqlinstallation failed"
    exit 1

    else

    echo "installing mysql is successful"

    fi
 else

 echo "mysql is already installed nothing to do"

 fi   
