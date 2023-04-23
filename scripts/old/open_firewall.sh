#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This must be run as root"
    exit 1
fi

#for port in 7777 7778 27015 7779 7780 27016; do
#    ufw allow $port/udp
#done

#Uncomment the next if you want to open the default rcon port
#ufw allow 27020/tcp

for port in 7777 7778 27015 7779 7780 27016; do
    #iptables -t filter -I INPUT -p udp --dport $port -j ACCEPT
    iptables -I INPUT -p udp --dport $port -j ACCEPT
    iptables -I INPUT -p tcp --dport $port -j ACCEPT
done

#Uncomment the next if you want to open the default rcon port
#iptables -t filter -I INPUT -p tcp --dport 27020 -j ACCEPT

iptables -L
