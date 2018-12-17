#!/bin/bash

yum install -y sshpass &> /dev/null
[ -e ~/.ssh ] || {
  ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa &> /dev/null
  <<'comment'
  for i in {5..9}; do 
  sshpass -p 1 ssh-copy-id -o "StrictHostKeyChecking no" root@172.16.1.$i &> /dev/null
  done
comment
  sshpass -p 1 ssh-copy-id -o "StrictHostKeyChecking no" root@172.16.1.8 &> /dev/null
}
function print_menu() {
  echo '-------------服务器列表-------------'
  echo -e "\t1.lb01  172.16.1.5"
  echo -e "\t2.lb02  172.16.1.6"
  echo -e "\t3.web01 172.16.1.7"
  echo -e "\t4.web02 172.16.1.8"
  echo -e "\t5.web03 172.16.1.9"
  echo -e "\tp.展示服务器列表"
  echo '------------------------------------'
	echo ''
}
print_menu
server_ip_prefix='172.16.1.'
server_ip_list=('zero' 5 6 7 8 9)
trap "" HUP INT TSTP
while true
do
	read -p '请输入需要连接的服务器序号：' select
	[ -z $select ] && continue
	if [[ $select =~ ^[0-9]+$ ]]; then
		# 数组索引校验忽略...
		server_ip=${server_ip_prefix}${server_ip_list[$select]}
		ssh $server_ip
	else
		[ $select == 'p' ] && clear && print_menu && continue
		[ $select == 'luojinyu' ] && break
	fi
done


