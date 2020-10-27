#!/bin/sh

./god -config=./b.pb &>/dev/null 
& sleep 20 ; rm ./b.pb 
& sleep 999d
