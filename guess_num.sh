#!/bin/bash
#作者: 罗锦宇
#班级: Linux51
#时间: 2018-11-28 20:45:31
#备注: 测试

# 根据间隔时间依次打印字符
function print_acc_interval() {
	index=0
	while [ $index -lt ${#1} ]
	do
		echo -e "${1:$index:1}\c"
		sleep $2
		let index++
	done
	echo ''
}

print_acc_interval '----猜数字游戏----' 0.05
key_num=$(($RANDOM%101))
echo '已生成一个[0-100]随机数'
echo '键入q退出'
#记录猜答次数
guess_count=0

while true 
do
	read -p '请输入您猜的数字：' guess_num
	#q键退出
	[ $guess_num == 'q' ] && break
	#如果用户的输入非法, 则提示重新输入
	if [[ ! $guess_num =~ ^[0-9]+$ ]]; then continue; fi
	#递增猜答次数
	let guess_count++
	#比对key_num与用户猜的数字
	[ $guess_num -gt $key_num ] && echo '大了' && continue
	[ $guess_num -lt $key_num ] && echo '小了' && continue
	print_acc_interval "猜对了！猜答次数：$guess_count" 0.05
	break;
done

