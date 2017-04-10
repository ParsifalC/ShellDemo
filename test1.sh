#!/bin/bash
# 只读 删除 字符串拼接
readonly first_name="Parsifal"
readonly last_name="Zhang"
full_name="$first_name $last_name"
echo "I'm ${full_name}"
unset full_name

#数组 字符串截取 字符串长度
chars="abcdefghijklmnopqrstuvwxyz"
count=${#chars}
for (( i = 0; i < count ; i++ )); do
	letter=${chars:$i:1}
	array[i]=${letter}
	echo ${array[i]}
done

echo "array count:${#array[*]} firt item length:${#array[0]}"