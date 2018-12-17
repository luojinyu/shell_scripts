#!/bin/bash

#作者：罗锦宇
#班级：Linux51
#时间：2018-12-03 20:55:35
#备注：测试

PS3='请输入您的选择：'
select name in oldboy oldgirl tingting
do
	echo $name
done


