#!/bin/bash
echo "这是个shell script:$0"
inputCount=$#
echo "你输入的参数个数有：${inputCount}"
echo "它们是：$*"

for i in "$@"; do
	echo "${i}"
done