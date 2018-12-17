#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-27 20:15:57
#备注: 工具函数库

# 根据间隔时间依次打印字符
function print_acc_interval() {
	index=0
	while [ $index -lt ${#1} ]
	do
		echo -e "${1:$index:1}\c"
		sleep $2
		let index++
	done
	echo ''
}

# 判断参数是否是正整数
function if_is_integer() {
  echo $1 | egrep '^[0-9]+$' &> /dev/null
  if [ $? -ne 0 ]; then return 0; fi
  if [ ${#1} -gt 1 ]; then
  	echo $1 | grep '^[0]' &> /dev/null
  	if [ $? -eq 0 ]; then return 0; fi
  fi
	return 1
}

# 接收一个文本文件为参数，打印其只有一个数字的行
function print_line_of_single_num() {
	for line in `cat $1`
	do
		echo $line | grep '^[^0-9]*[0-9][^0-9]*$' &> /dev/null
		if [ $? -eq 0 ]; then
			echo $line
		fi
	done
}

# 接收一个url，判断其http状态码是否为200
function check_url() {
	http_code=`curl -Is $1 | awk 'NR==1{print $2}'`
	if [ $http_code -eq 200 ]; then
		echo "$1 访问正常"
	else
		echo "$1 访问异常"
	fi
}

function sort_string() {
	str=`echo $1 | sed -r 's/[^[:alpha:]]//g'`
	index=1
	while [ $index -le ${#str} ]
	do
		echo $str | cut -c $index >> alpha_list
		((index++))
	done
	echo $alpha_list | sort | uniq -c | sort -rn
}
sort_string 'asdfkjlji^(*)&(*&((234234asdfsd'

