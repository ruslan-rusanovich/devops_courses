#!/bin/bash

echo "Enter new username"
read USERNAME
user_exist=`grep $USERNAME /etc/passwd | wc -l`
if [ $user_exist -gt 0 ]
then
	echo "User $USERNAME already exists!"
else
	echo "Gonna create new user $USERNAME"
	useradd $USERNAME
fi
