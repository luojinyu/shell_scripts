#!/bin/bash

line=`wc -l < pwd.txt`

for i in `seq $line`
do 
	linetext=`sed -n "${i}p" pwd.txt`
	str_num=`echo $linetext | sed 's/[^0-9]//g'`
	[ ${#str_num} -eq 1 ] && echo $linetext
done


