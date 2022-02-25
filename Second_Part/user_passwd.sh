#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
  echo "You need to be root or use sudo command to proceed."
  exit 1
fi

read -p "Enter the username to create: " USER_NAME

read -p "Enter the full name or description: " COMMENT

read -sp "Enter the password to use for this account: " PASSWORD && echo " "

useradd -c "${COMMENT}" -m ${USER_NAME} 2> /dev/null # If it gives standard error, sends it to /dev/null that ignores it.

if [[ "${?}" -ne 0 ]]
then
   echo "This username is already exit. Please select different username."
   exit 1
fi

echo ${PASSWORD} | passwd --stdin ${USER_NAME}  # sets the password

if [[ "${?}" -ne 0 ]]
then
  echo "The password for the account could not be set."
  exit 1
fi
passwd -e ${USER_NAME} # Force password change at the first login.
