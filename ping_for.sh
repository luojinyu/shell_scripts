#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-04 10:39:36
#备注：测试


for i in {1..254}
do
	{
  	ip="10.0.0.$i"
  	ping -c1 $ip &> /dev/null
  	[ $? -eq 0 ] && echo "$ip在线" && continue
  	echo "$ip不在线"
	} &
done

