#!/bin/bash

#判断文件类型是否为 png
thinPngImage(){
	isPngImage $1
	isPng=$?

	if [[ $isPng = 1 ]]; then
		echo "开始压缩：$1.."
		crunch $1
		echo "压缩完成，开始替换.."
		nosuffix=${1%.*}
		crunchname="$nosuffix-crunch.png"
		mv $crunchname $1
		echo "替换完成.."
	fi
}

isPngImage(){
	pngtype="PNG image data"
	type=$(file -b $1 | cut -d, -f1)

	if [[ $type = $pngtype ]]; then
		return 1
	else
		return 0
	fi
}

#递归遍历当前目录所有文件
startThining(){
	dir=$(ls)

	for i in $dir 
	do 
		if [[ -d "$i" ]]; then
			cd "$i"
			startThining
			cd ..
		else
			thinPngImage $i
		fi
	done
}

startThining