#!/bin/bash

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-28 11:20:24
#备注: 测试

os_version=`hostnamectl | awk -F': ' 'NR==7{print $2}'`
core_version=`hostnamectl | awk -F': ' 'NR==9{print $2}'`
vm_platform=`hostnamectl | awk -F': ' 'NR==6{print $2}'`
hostname=`hostname`
eth0_ip=`hostname -I | awk '{print $1}'`
lo_ip=`ip a show lo | awk 'NR==3{print $2}'`
#outer_ip=`curl cip.cc | awk -F': ' 'NR==1{print $2}'`
#outer_ip=`curl icanhazip.com`
outer_ip=`curl -s http://ip.3322.net`
echo "系统版本：$os_version"
echo "内核版本：$core_version"
echo "虚拟平台：$vm_platform"
echo "主机名称：$hostname"
echo "eth0--IP：$eth0_ip"
echo "  lo--IP：$lo_ip"
echo "外网--IP：$outer_ip"

