#!/bin/bash

#判断文件类型是否为 png
detectPngFile(){
	# type = $(file -b $1 | cut -d, -f1)
	# echo $type
	echo $1
}

#递归遍历当前目录所有文件
getFilePaths(){
	dir=$(ls)

	for i in $dir 
	do 
		if [[ -d "$i" ]]; then
			cd "$i"
			getFilePaths
			cd ..
		else
			detectPngFile $i
		fi
	done
}

getFilePaths