#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ]
then 
   echo -e "$G Source directory exists  $N"
   exit 1
else
   echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +2")

while IFS= read -r line
do
  echo "Deleting file: $line
  rm -rf $line
done <<<$FILES
