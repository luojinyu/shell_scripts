#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-28 10:53:39
#备注: 测试

while :
do
	val=`uptime | awk '{print $(NF-2)}' | awk -F',' '{print $1}'`
	echo $val
	if [ ${val%.*} -ge 2 ]; then
		echo '负载>2!!'
		break
	fi
	sleep 0.5
done

