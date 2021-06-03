# Disable access control for the current user.
#xhost +SI:localuser:$USER

# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#
# for terminus font in Archlinux :(
#xset +fp /usr/share/fonts/local
#xset fp rehash

#xset -b # disable bell
#eval `/usr/bin/ssh-agent`

#if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
#then
#	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
#fi
#
#if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
#then
#	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
#fi

# 1280x720 = 720p X220
#hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -merge $HOME/.Xresources
#xmodmap ~/.Xmodmap
#setxkbmap -layout gb -option ctrl:nocaps

#exec i3

setxkbmap pl &
xset r rate 250 100 s 600 600 dpms 36000 36000 36000 &
#xsetroot -solid white &
#xsetroot -solid black &
nitrogen --set-scaled --save --restore &
#picom &
picom2 --config /home/peter/.config/picom2.conf &
#xbindkeys &
sxhkd -c /home/peter/.config/sxhkd/sxhkd-xinit &
#sxhkd &
udiskie &

#picom --experimental-backends &

#while xsetroot -name "    VOL:$VOL $LOCALTIME $WEATHER"
#do
#    WEATHER=$(wttr.in?format="%c+%p+%t+%w+%P")
#    VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
#    #LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
#    LOCALTIME=$(date +%d.%m,»%H·%M)
#    #OTHERTIME=$(TZ=Europe/Warsaw date +%Z\=%H:%M)
#    #TEMP=$(((cat /sys/class/thermal/thermal_zone0/temp) / 1000)C)
#    sleep 15
#done &

#|`awk '{ print $1,$2,$3 }' /proc/loadavg`|
#  兩
#  cat /sys/class/net/enp25s0/operstate


#while xsetroot -name "爛 `mpstat --dec=1 1 1 | awk '(NR==4){ print $3 }'`%   `curl wttr.in?format='%c+%p+%t+%w+%P'`    `sed 's/down//;s/up//'  /sys/class/net/enp25s0/operstate`     奄 `amixer get Master | tail '-1' | sed 's/.*\[\([0-9]*%\)\].*/\1/'`    `free '-h' | awk '(NR==2){ print $3 }'`    `awk '{ print substr($1/1000,1,2) }' /sys/bus/pci/drivers/k10temp/0000:00:18.3/hwmon/hwmon0/temp1_input`°C     `date +%a.%d.%b.` `date +%H·%M` "
#	do
#            sleep 4
#	done &
	
#while :; do
#    ssh-agent dwm
#done

#Emacs exwm configuration:
# Set default cursor.
#xsetroot -cursor_name left_ptr
#exec emacs
#xbindkeys
#/home/peter/.emacs.d/start-exwm.sh

#dwmbar&
/usr/local/bin/dwmblocks & 
#exec /usr/local/bdwm/bin/dwm
exec /usr/local/bin/dwm

#exec bspwm

#exec i3
#exec launch-xmonad.sh
#exec xmonad 
