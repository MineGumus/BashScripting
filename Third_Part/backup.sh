#!/bin/bash

if [[ ${UID} -ne 0 ]]  # Checks if user has root privilage or not.
then
  echo "You can use this bash script only with root privilage."
  exit 1
fi

backup_files="/home/ec2-user/data /etc /boot /usr" # Files that we want to back up.

# create archive filename based on time
dest="../../../mnt/backup" # destination to back up files
day=$(date +%Y%m%d-%H%M)
hostname=$(hostname -s) # -s cuts the extension of hostname from first period.
archive_file="$hostname-$day.tgz"

echo "We will back up ${backup_files}" to ${dest}/${archive_file}"  # prints start status message

tar czf ${dest}/${archive_files} ${backup_files}

echo "Congratulations! Your back up is ready." # prints end status message.
