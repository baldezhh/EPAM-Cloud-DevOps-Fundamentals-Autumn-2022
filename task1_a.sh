#!/bin/bash

show_help(){
	echo "Nmap service have to be installed for script to work";
	echo "Use with --all    to display all ip-adresses with hostnames";
	echo "Use with --target to display all open TCP ports (sudo will provide more info)";
}

flags(){
	if [[ $1 == "--all" ]]
	then
        	echo "Starting search...";
        	nmap -sn 192.168.0.1/24 | grep -i 'report for' | sed 's/Nmap scan report for/Found ip adress -/';
        	echo "Search is finished.";
	elif [[ $1 == "--target" ]]
	then
        	netstat  -tulpn | grep "tcp" | grep "LISTEN";
	else
		echo "Your argument is not valid, please choose one from listed below"
		echo "--all, --target"
	fi
}


case $# in
0	) show_help ;;

1	) flags $1 ;;

*	) echo "Use only 1 argument" ;;
esac
