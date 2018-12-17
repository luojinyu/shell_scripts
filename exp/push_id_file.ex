#!/usr/bin/expect

#作者: 罗锦宇
#班级: Linux51
#时间: 2018-12-04 17:25:39
#备注: expect免交互推送公钥

if {$argc != 2} {
	puts "usage: expect $argv0 host pass"
	exit
}

set host [lindex $argv 0]
set pass [lindex $argv 1]

spawn ssh-copy-id $host
expect {
	"(yes/no)?" {send "yes\r"; exp_continue}
	"password:" {send "$pass\r"}
}
expect eof

