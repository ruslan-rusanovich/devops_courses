#!/bin/bash

FILE="task1.txt"
counter=`grep error $FILE | wc -l`
echo $counter
if [ $counter -gt 0 ]
then
	echo "removing file"
	rm $FILE
else
	echo "File is ok. No need to remove it"
fi
