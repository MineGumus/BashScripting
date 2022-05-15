#!/bin/sh

# Shell script to monitor or watch the disk space
# Set alert level 80% is default
ALERT=80

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 80 ]; then
    echo "WARNING:The partition \"$partition\" has used $usep% of total available space - Date: $(date)"
  fi
done

