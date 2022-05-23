#!/bin/bash

sourceFile="dados-covid/dados-covid-owid.csv"
destinationFile="paises-afetados-covid-owid.txt"

# awk sets the field separator and the nth column we want
awk -F "," '{print $3}' $sourceFile | sort | uniq > $destinationFile
