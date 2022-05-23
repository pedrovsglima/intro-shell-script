#!/bin/bash

dateAndTimeForFileContent=$(date +'%F,%H:%M:%S')
dateAndTImeForFilename=$(date +'%F-%H-%M-%S')
dateForLogFolder=$(date +'%Y/%m')

scriptPath=`realpath $0`
scriptFolderPath=`dirname $scriptPath`
logFolderPath="$scriptFolderPath/logs/"

# define ./YYYY/mm folder path by concatenating 'logFolderPath' and 'dateForLogFolder'
logFolder="$logFolderPath$dateForLogFolder"

# full path to the file that stores the data
logFilePath="$logFolder/$dateAndTImeForFilename.txt"

# create ./YYYY/mm folder if it does not exist
[ -d $logFolder ] || mkdir -p $logFolder

# top 5 running processes by memory usage (in MB)
fiveTopRunningProcessesByMemoryUsageInMB=$(ps -eo rss,comm --no-headers --sort -rss | head -n 5 | numfmt --to=iec --from-unit=1024 --suffix=B | awk '{OFS=","; print $1, $2}')

# reads each line passed as input and stores it in the 'process' variable
while read process;
do
    echo "$dateAndTimeForFileContent","$process" >> $logFilePath
done <<< $fiveTopRunningProcessesByMemoryUsageInMB
