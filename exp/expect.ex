#!usr/bin/expect
spawn ssh root@10.0.0.8

expect {
	"(yes/no)?" { send "yes\r"; exp_continue }
	"password:" { send "1\r" }
}
interact

