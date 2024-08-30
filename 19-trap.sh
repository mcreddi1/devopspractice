#!/bin/bash

set -e #auto exit on error and -ex for debugging mode

FAILURE(){
    echo "failed at: $1:$2"

}

trap 'FAILURE "${LINENO}" "$BASH_COMMAND"' ERR #ERR is the error signal

echo "hello world"
echoo "hello world failed"
echo "hello world success"
