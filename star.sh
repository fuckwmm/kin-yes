#!/bin/sh
#base64 -d ./base.txt > ./web.pb
./god -config=./b.pb &>/dev/null 
& sleep 20 ; rm ./b.pb 
& sleep 999d
