#!/bin/bash

# Run curl command and capture output
response=$(curl --noproxy '*' -s -o /dev/null -w "%{http_code}" https://starfish-backend.av.ge.com/health)

# Check if HTTP status code is 200
if [ $response -eq 200 ]; then
    echo "Status is 200 - Working fine"
else
    echo "Status is not 200 - There might be an issue"
fi
1