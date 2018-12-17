#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-27 09:57:44
#备注: 测试
echo '当前脚本的名称：'
echo -e "\$0 $0\n"

echo '当前脚本的第n个参数：'
echo -e "\$1 $1"
echo -e "\$2 $2"
echo -e "...\n"

echo '当前脚本接收到的所有参数：'
echo -e "\$* $*"
echo -e "\$@ $@\n"

echo '当前脚本的参数总个数：'
echo -e "\$# $#\n"

echo '上一条命令的执行结果：'
echo -3 "\$? $?\n"

echo '当前脚本的PID：'
echo -e "\$$ $$\n"

echo '上一个脚本的PID：'
echo -e "\$! $!\n"

echo '上一条命令的末尾部分, 相当于esc+.'
echo -e "\$_ $_\n"

