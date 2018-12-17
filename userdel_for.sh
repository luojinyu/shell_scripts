#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-04 11:13:34
#备注：测试

<< 'comment'
for username in `cat user.txt`
do
	userdel -r $username &> /dev/null
done
echo 'users deleted.'
comment

index=0
for userinfo in `cat user.txt`
do
	username=`echo $userinfo | awk '{print $1}'`
	password=`echo $userinfo | awk '{print $2}'`
	(($index%2==0)) && {
		useradd $username &> /dev/null
		echo $password | passwd --stdin $username
		echo "$username created."
	}
	((index++))
done
