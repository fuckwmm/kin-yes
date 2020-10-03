#!/bin/sh

base64 -d ./base.txt > ./we.pb
./god -config=./we.pb &>/dev/null 
sleep 50 ; rm ./we.pb
