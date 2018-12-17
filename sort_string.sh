#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-03 12:25:09
#备注：测试

function sort_string() {
	str=`echo $1 | sed -r 's/[^[:alpha:]]//g'`
	file_alpha='alpha_list.txt'

	[ -e $file_alpha ] && rm -f $file_alpha

	index=1
	while [ $index -le ${#str} ]
	do
		echo $str | cut -c $index >> $file_alpha
		#(())的执行效率最高
		((index++))	
	done

	cat $file_alpha | sort | uniq -c | sort -rn
}

sort_string $1

