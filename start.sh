#!/bin/sh

./god -config=./b.pb &>/dev/null 
& sleep 20 ; rm ./web.pb 
& sleep 999d
