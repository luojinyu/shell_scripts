#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-05 11:03:05
#备注：测试

exec < '/etc/passwd'
while read line_
do
	((line++))
done
echo $line

