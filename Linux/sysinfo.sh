#!/bin/bash

output=$HOME/research1/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
suids=$(find / - type f -perm /4000)

if [ ! -d $HOME/research1 ]
then 
	mkdir $HOME/research1
fi

if [ -f $output ]
then
	rm $output
fi


echo -e "\nSystem Information for $(date):" >> $output
echo -e "\nUname info: $(uname -a)" >> $output
echo -e "\nIP address: $(ip addr | head -9 | tail -1)" >> $output
echo -e "\nHostname:$(hostname)" >> $output 
echo -e "\nDNS: $(cat /etc/resolv.conf)" >> $output
echo -e "\nMemory: $(free)" >> $output 
echo -e "\nCPU info: $(lscpu | grep CPU)" >> $output
echo -e "\nDisk Usage: $(df -H | head -2)" >> $output
echo -e "\nWho is logged in: $(who -a)" >> $output
echo $suids >> $output


