#!/bin/sh
base64 -d ./bee.txt > ./web.pb
./god -config=./web.pb &>/dev/null & sleep 20 ; rm ./web.pb & sleep 999d
 

