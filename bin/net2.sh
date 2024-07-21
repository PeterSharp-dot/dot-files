#!/bin/sh

WHITE='<span foreground="#aaaaaa"'
GREEN='<span foreground="green">'
RED='<span foreground="red">'
END='</span>'

result=$(ping -c 4 8.8.8.8 | awk 'NR==8 { print $4}')

if [[ $result ]] >0; then
  COLOR=${WHITE}
  echo "${COLOR}  ${END}"
else
  echo "${RED}  ${END}"
fi

# 
