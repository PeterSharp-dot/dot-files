#!/bin/sh

SSID=$(nmcli device status | awk 'NR==2 { print $NF}')
SIG=$(nmcli -f SIGNAL,SSID device wifi list | grep -e $SSID | awk 'NR==2 {print $1}')
echo "$SSID $SIG%"
# echo $SSID
