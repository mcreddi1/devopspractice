#!bin/bash

PERSON1=Ram
PERSON2=suresh

echo "$PERSON1:: hi $PERSON2, how are you."
echo "$PERSON2:: hi $PERSON1, i'm fine how are you doing"
echo "$PERSON1:: ok bye"

#!/bin/bash
PERSON1=Raheem
PERSON2=Suresh

echo "$PERSON1:: Hi ${PERSON2}, How are you?"
echo "${PERSON2}:: Hello $PERSON1. I am fine. How are you doing?"
echo "$PERSON1:: I am doing good ${PERSON2}. What's going on?"
echo "${PERSON2}:: I started learning Shell Script $PERSON1"