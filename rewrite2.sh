#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-04 11:29:34
#备注：测试

while read line
do
	username=`echo $line | awk '{print $1}'`
	password=`echo $line | awk '{print $2}'`
	useradd $username &> /dev/null
	echo $password | passwd --stdin $username &> /dev/null
	echo "$username created."
done < 'user.txt'

