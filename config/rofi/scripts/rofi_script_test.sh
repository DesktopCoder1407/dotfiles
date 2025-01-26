#!/bin/bash

if [ "$1" != "" ]
then
    wl-copy "$1"
    exit 0
fi

echo "Thing 1"
echo "Thing 2"
echo "Thing 3"
