#!/bin/bash

#global variables
dir=$(ls)
currentDir=$(cd "$(dirname "$0")";pwd)

#write the thining result to file
#param:result
#eg:writeThiningReport "1MB 500Kb /imgs/assets"
writeThiningReport(){
	if [[ -e ~/desktop/ThiningRepot.txt ]]; then
		echo $* >> ~/desktop/ThiningRepot.txt
	else
		echo "OriginalSize | CurrentSize | ResourcePath" > ~/desktop/ThiningRepot.txt
		writeThiningReport $*
	fi

  	# open ~/desktop/ThiningRepot.txt
  	column -t -s '|' ~/desktop/ThiningRepot.txt
}

#thin the given img
#param:imagepath
#eg:thinPngImage "/imgs/eg.png"
thinPngImage(){
	isPngImage $1
	isPng=$?

	if [[ $isPng = 1 ]]; then
		echo "start thining：$1.."
		crunch $1
		echo "complete thining，start replacing.."
		nosuffix=${1%.*}
		crunchname="$nosuffix-crunch.png"
		mv $crunchname $1
		echo "done：$1"
	fi
}

#detect img type if it is a png
#param:filepath
#eg:isPngImage "/test/file.png"
isPngImage(){
	pngtype="PNG image data"
	type=$(file -b $1 | cut -d, -f1)

	if [[ $type = $pngtype ]]; then
		return 1
	else
		return 0
	fi
}

#start thining all the png imgs under current directory
startThining(){
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

# startThining