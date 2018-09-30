#!/bin/sh
touch tmp.txt
openssl enc -aes-128-cbc -a -salt -pass pass:asdffdsa -in $1 -out tmp.txt
rm $1
cp tmp.txt $1
rm tmp.txt