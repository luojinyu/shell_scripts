#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-04 11:22:17
#备注

line=`wc -l < user.txt`

for i in `seq $line`
do
	userinfo=`sed -n "${i}p" user.txt`
	username=`echo $userinfo | awk '{print $1}'`
	password=`echo $userinfo | awk '{print $2}'`
	useradd $username &> /dev/null
	echo $password | passwd -stdin $username &> /dev/null
	echo "$username created."
done

