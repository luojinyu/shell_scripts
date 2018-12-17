#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-04 11:01:26
#备注：测试

for username in `cat /server/scripts/user.txt`
do
	useradd $username &> /dev/null
	echo '123' | passwd --stdin $username &> /dev/null
	echo "$username created."
done

