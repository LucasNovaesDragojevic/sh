#!/bin/bash

function checkConflict() {
	local file="$1"
	if grep -q -E '<<<<<<<|=======|>>>>>>>' "$file"; then
		echo "The file $file has conflicts"
	fi
}

function checkFolder() {
	local folder="$1"
	local file
	for file in "$folder"/*; do
		if [ -f "$file"  ]; then
			checkConflict "$file"
		elif [ -d "$file" ]; then
			checkFolder "$file"
		fi
	done
}

if [ $# -ne 1 ]; then
	echo "Used: $0 folder"
	exit 1
fi

if [ ! -d "$1" ]; then
	echo "Folder not founded $1"
	exit 1
fi

checkFolder "$1"
