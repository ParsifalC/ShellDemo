#!/bin/bash
getFilePaths () {
	dir=$(ls)

	for i in $dir 
	do 
		if [[ -d "$i" ]]; then
			cd "$i"
			getFilePaths
		fi
		echo $i
	done
}

getFilePaths