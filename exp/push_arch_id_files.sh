#!/bin/bash

[ -e ~/.ssh ] || {
	ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa &> /dev/null
	[ $? -ne 0 ] && echo 'error: execute ssh-keygen failure.' && exit
	echo 'info: execute ssh-keygen success.'
}

ip_prefix='172.16.1.'
ip_array=(5 6 7)
pass='1'
exp_file='push_id_file.ex'
rst_file='rst.info'
>$rst_file

for suffix in ${ip_array[@]}
do
	{	
		ip=$ip_prefix$suffix
		expect $exp_file $ip $pass &> /dev/null
		[ $? -eq 0 ] && echo "$ip success." >> $rst_file \
								 || echo "$ip failure."	>> $rst_file
	} &
done

<< 'comment'
上一个循环里使用子shell异步执行推送公钥的过程, 
程序执行完成后无法显示命令提示符, 
用户难以判定程序是否执行完成, 
所以使用以下死循环实时监控程序是否执行完成
comment

while true
do
	rst_line=`wc -l < $rst_file`
	[ $rst_line -eq ${#ip_array[@]} ] && cat $rst_file && exit
done
