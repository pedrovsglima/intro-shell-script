#!/bin/bash

echo "criando arquivos"
touch log1.txt log2.txt

echo "arquivo log1"
ls -lha > log1.txt

echo "arquivo log2"
top -n 5 > log2.txt

echo "criando diretorio"
mkdir -p backup_logs

echo "copiando arquivos"
cp log1.txt log2.txt ./backup_logs

echo "done"
