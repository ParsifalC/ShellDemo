#!/bin/bash

#判断文件类型是否为 png
detectPngFile(){
	pngtype="PNG image data"
	type=$(file -b $1 | cut -d, -f1)

	if [[ $type = $pngtype ]]; then
		echo "开始压缩：$1.."
		crunch $1
		echo "压缩完成，开始替换.."
		nosuffix=${1%.*}
		crunchname="$nosuffix-crunch.png"
		mv $crunchname $1
		echo "替换完成.."
	fi
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