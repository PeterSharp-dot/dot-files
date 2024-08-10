#!/bin/bash

if test "$TERM" = "xterm-256color"
    echo -en "\e]P0000000" # tło w tty
    echo -en "\e]P1d13330" # red
    echo -en "\e]P20f8c29" # green 
    echo -en "\e]P3b58900" # yellow
    echo -en "\e]P412486e" # blue
    echo -en "\e]P5b7afba" # beżowy
    echo -en "\e]P62aa198" # cyan
    echo -en "\e]P748757d" # podstawowy tekst w tty
    echo -en "\e]P8555555" # szary
    echo -en "\e]P9cb4b16" # orange
    echo -en "\e]PA55bbb4" # seledyn prompt w fish shell
    echo -en "\e]PB875196" # mocny pomarańcz
    echo -en "\e]PC25a4ba" # kolor katalogów w tty
    echo -en "\e]PD6c71c4" # violet Visual mode w fish shell
    echo -en "\e]PE697a68" # szaro zielony
    echo -en "\e]PF6a79a3" # base3 tokionight tekst w tty
    clear
end
# echo -en "\e]P77b8cbd" # podstawowy tekst w tty
