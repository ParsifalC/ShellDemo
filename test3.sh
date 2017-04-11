#!/bin/bash
array=(a b c d e f g)

echo "item count:${#array[*]}"
echo "items:${array[*]}"

for item in ${array[@]}; do
	echo "item:${item}"
done