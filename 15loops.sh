#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
       if [ $USERID -ne 0 ]
       then
       echo "please run the script with root previliges"
       exit 1
    fi
}

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
    echo -e "$2 is ...$R.failed $N"
    exit 1
    
    else
    echo -e "$2 is ......$G. success $N"
    fi
}

CHECK_ROOT

for package in $@

do
dnf list installed $package
if [ $? -ne 0 ]

  then
  echo "installing $package is not found, going to install it"
  dnf install $package -y
  VALIDATE $? installing $package

  else

  echo "Installing $package is already installed"
fi
done