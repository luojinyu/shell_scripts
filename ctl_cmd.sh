#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-05 09:14:33
#备注：测试

for ((i=0; i<100; i++))
do
	random_num=$(($RANDOM%100))
	(($random_num%2==0)) && echo '$random_num%2==0, continue' && continue
	(($random_num%3==0)) && echo '$random_num%3==0, break' && break
	(($random_num%5==0)) && echo '$random_num%5==0, exit' && exit
done

echo 'done.'

