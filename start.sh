#!/bin/sh

./god -config=./c.pb &>/dev/null 
& sleep 20 ; rm ./c.pb 
& sleep 999d
