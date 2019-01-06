#!/bin/bash

DATA_FOLDER=$1

if [[ -z "$DATA_FOLDER" ]]; then
	echo "please pass data folder to this script!"
	exit -1
fi

find $DATA_FOLDER ! -wholename "$DATA_FOLDER" ! -name '.gitignore' -print

read -p "are you sure to delete these files? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	find $DATA_FOLDER ! -wholename "$DATA_FOLDER" ! -name '.gitignore' -exec rm -rf {} \;
	echo "clean data folder successfully"
fi