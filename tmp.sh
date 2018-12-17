#!/bin/bash
sum=0
for mem in `ps aux | awk '{print $6}' | egrep -v 'RSS|0'`
do
  let "sum+=$mem"
done
echo "系统所有进程占用内存大小为：$(($sum/1024))M."
