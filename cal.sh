#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-27 18:18:43
#备注: 测试

# 判断参数个数
if [ $# -ne 2 ]; then
	echo 'please input 2 args.'
	exit 1
fi

# 校验参数是否合法
arg=$1
for i in 1 2
do
	# 第二次循环时判断$2
	if [ $i -eq 2 ]; then arg=$2; fi
	# 判断参数是否是纯数字字符串
  echo $arg | egrep '^[0-9]+$' &> /dev/null
  if [ $? -ne 0 ]; then echo "arg$i is not integer"; exit 2; fi
	# 如果参数是长度大于1的纯数字字符串则判断其是否以0开头
  if [ ${#arg} -gt 1 ]; then
  	echo $arg | grep '^[0]' &> /dev/null
  	if [ $? -eq 0 ]; then echo "arg$i can not start with 0"; exit 3; fi
  fi
done

# 依次实现两个参数的+-*/运算
echo "$1 + $2 = $(($1+$2))"
echo "$1 - $2 = $(($1-$2))"
echo "$1 * $2 = $(($1*$2))"
if [ $2 -eq 0 ]; then
	echo 'error: division by 0.'
	exit 4
fi
echo "$1 / $2 = $(($1/$2))"


