#!/bin/bash

covidPath="covid-19-data-master/public/data/"

dataOldName="owid-covid-data.csv"
dataNewName="dados-covid-owid.csv"

codebookOldName="owid-covid-codebook.csv"
codebookNewName="manual-dados-covid-owid.csv"

scriptPath=`realpath $0`
scriptFolderPath=`dirname $scriptPath`
covidFolder="$scriptFolderPath/dados-covid/"

wget https://github.com/owid/covid-19-data/archive/refs/heads/master.zip

# unzip files 'owid-covid-data.csv' and 'owid-covid-codebook.csv'
unzip master.zip "$covidPath$dataOldName" "$covidPath$codebookOldName"

# create folder if it does not exist
[ -d $covidFolder ] || mkdir -p $covidFolder

# move files
mv "$covidPath$dataOldName" "$covidPath$codebookOldName" $covidFolder

# rename files
mv "$covidFolder$dataOldName" "$covidFolder$dataNewName"
mv "$covidFolder$codebookOldName" "$covidFolder$codebookNewName"

# remove unnecessary file and folder
rm master.zip
rm -r covid-19-data-master/


