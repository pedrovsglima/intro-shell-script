#!/bin/bash

dateAndTimeForFileContent=$(date +'%F,%H:%M:%S')
dateAndTImeForFilename=$(date +'%F-%H-%M-%S')

# top 5 running processes by memory usage (in MB) 
# OFS stores the output field separator, which separates the fields when awk prints them
fiveTopRunningProcessesByMemoryUsageInMB=$(ps -eo rss,comm --no-headers --sort -rss | head -n 5 | numfmt --to=iec --from-unit=1024 --suffix=B | awk '{OFS=","; print $1, $2}')

# reads each line passed as input and stores it in the 'process' variable
while read process;
do
	echo "$dateAndTimeForFileContent","$process" >> "$dateAndTImeForFilename.txt"
done <<< $fiveTopRunningProcessesByMemoryUsageInMB
