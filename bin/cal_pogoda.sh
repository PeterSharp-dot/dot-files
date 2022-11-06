#!/bin/sh
#pokaz= "$(curl -Ss wttr.in | sed -e 's/5;226m/5;208m/g' -e 's/5;190m/5;208m/g')"
#echo $pokaz
#notify-send -t 20000 "Update weather" "$(curl -Ss wttr.in?qT | sed -e 's/5;226m/5;208m/g' -e 's/5;190m/5;208m/g')"
notify-send -t 20000 "Update weather" "$(curl -Ss wttr.in?qT)"
