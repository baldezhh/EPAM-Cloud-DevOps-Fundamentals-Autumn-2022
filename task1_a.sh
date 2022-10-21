#!/bin/bash

case $# in
0	)
echo "Nmap service have to be installed for script to work"
echo "use with --all 	to display all ip-adresses with hostnames";
echo "use with --target to display all open TCP ports" 
;;

1	)
if [[ $1 == "--all" ]]
then
	echo "Starting search..."
	nmap -sn 192.168.0.1/24 | grep -i 'report for' | sed 's/Nmap scan report for/Found ip adress -/'
	echo "Search is finished."
elif [[ $1 == "--target" ]]
then
	netstat  -tulpn | grep "tcp" | grep "LISTEN"
fi
;;

*	)
	echo "Use only 1  argument pls"
;;
esac
