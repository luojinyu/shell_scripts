#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-26 20:37:36
#备注: 测试

normal_user_count=0
threshold=1000
for line in `cat /etc/passwd`
do
	user_id=`echo $line | awk -F':' '{print $3}'`
	if (( $user_id<=$threshold ));
	#if [ $user_id -ge $threshold ]
	then
		user_name=`awk -F':' '{print $1}'`
		echo $user_name
		let "normal_user_count++"
	fi
done
echo "normal_user_count: $normal_user_count"
