#!/bin/bash

IP=$(ifconfig ppp0 | grep inet | cut -d: -f2 |awk '{print $2}') #IP assigned post connected to ppp0 VPN

echo $IP  #echos ppp0 IP

route del -net 0.0.0.0 gw $IP dev ppp0 

route add -net 172.16.0.0 gw $IP netmask 255.255.0.0 dev ppp0 #add static route

route add -net 192.168.0.0 gw $IP netmask 255.255.0.0 dev ppp0
