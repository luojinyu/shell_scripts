#!/bin/bash

. /etc/init.d/functions
print_result() {
	[ $? -eq 0 ] && action "nginx ${1}." /bin/true
}
fun_start() {
	/usr/sbin/nginx && print_result started
}
fun_stop() {
	/usr/sbin/nginx -s stop && print_result stopped
}
fun_restart() {
	/usr/sbin/nginx -s stop && sleep 2
	/usr/sbin/nginx && print_result restarted
}
fun_reload() {
	/usr/sbin/nginx -s reload&>/dev/null && print_result reloaded
}
fun_status() {
	nginx_pid=`ps aux | grep 'nginx' | grep 'master' | awk '{print $2}'`
	nginx_port=`netstat -ltunp | grep nginx | awk '{print $4}' | awk -F':' '{print $2}'`
	echo -e "nginx_pid: $nginx_pid \nnginx_port: $nginx_port"
}

case $1 in
		start) fun_start;;
	   stop) fun_stop;;
	restart) fun_restart;;
	 reload) fun_reload;;
	 status) fun_status;;
				*) echo 'error: invalid arg.'
esac

