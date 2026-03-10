#!/bin/bash

THRESHOLD=40
DISKUSAGE=$(df -h | grep -w / | awk '{print $5}' | sed 's/%//')
if [ $DISKUSAGE -gt $THRESHOLD ];
 then


echo "More than $THRESHOLD% of disk space is used. Searching for the largest directories and files..."

du -ah / | sort -rn | head
else
echo "Used disk space in root folder less then $THRESHOLD"
fi

