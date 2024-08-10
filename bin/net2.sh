#!/bin/sh

WHITE='<span foreground="#aaaaaa">'
GREEN='<span foreground="green">'
RED='<span foreground="red">'
END='</span>'

result=$(ping -c 4 8.8.8.8 | awk 'NR==8 { print $4}')
SSID=$(nmcli device status | awk 'NR==2 { print $NF}')
SIGN=$(nmcli -f SIGNAL,SSID device wifi list | awk 'NR==2 {print $1}')

if [[ $result ]] >0; then
  COLOR=${WHITE}
  # echo "${COLOR}  ${SSID} ${SIG}% ${END}"
  echo "${COLOR} ${SIGN}%${END}"
else
  echo "${RED}  ${END}"
fi

# 
