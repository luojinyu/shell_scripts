#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-28 09:55:50
#备注: 测试

mem_total=`free -m | awk 'NR==2{print $2}'`
mem_used=`free -m | awk 'NR==2{print $3}'`
mem_used_percent=`echo ''|awk "{print $mem_used/$mem_total * 100}"`
echo "内存使用率：${mem_used_percent}%"

