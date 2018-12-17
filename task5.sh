#!/bin/bash

while read line
do
	echo $line | grep '^[^0-9]*[0-9][^0-9]*$' &> /dev/null
	[ $? -eq 0 ] && echo $line
done < 'pwd.txt'

