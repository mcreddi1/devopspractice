#!/bin/bash

echo "all variables are: $@"

echo "no of variable: $#"

echo "scrio name: $0"

echo "present working directory: $PWD"

echo "home directory of the user: $HOME"

echo "pid of the current process: $$"

sleep 100 &

echo "pid of the last background process: $!"