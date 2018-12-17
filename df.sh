#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-28 09:23:02
#备注: 测试

#mem_used=`df | awk 'NR==2{print $5}' | egrep '[0-9]+' -o`

mem_used_percent=`df | awk 'NR==2{print $5}'`

#mem_used=`echo $mem_used_percent | egrep '[0-9]+' -o`
#mem_used=`echo $mem_used_percent | awk -F'%' '{print $1}'`
mem_used=`echo ${mem_used_percent%[%]}`

[ $mem_used -gt 10 ] && echo '磁盘使用率超过10%' && exit 1
echo '磁盘使用率低于10%'

