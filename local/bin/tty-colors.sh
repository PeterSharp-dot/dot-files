#!/bin/bash

if test "$TERM" = "xterm-256color"
    echo -en "\e]P002181f" # tło ciemnozielone w tty
    echo -en "\e]P18f5c5b" # red
    echo -en "\e]P2017a3a" # green 
    echo -en "\e]P3b58900" # yellow
    echo -en "\e]P4268bd2" # blue
    echo -en "\e]P55e3a4c" # magenta
    echo -en "\e]P62aa198" # cyan
    echo -en "\e]P706536b" # podstawowy tekst w tty
    echo -en "\e]P84a614a" # zgaszona zieleń
    echo -en "\e]P9cb4b16" # orange
    echo -en "\e]PA5b708f" # jasno fioletowy  prompt w fish shell
    echo -en "\e]PB3e5773" # base00
    echo -en "\e]PC284161" # kolor katalogów w tty
    echo -en "\e]PD6c71c4" # violet Visual mode w fish shell
    echo -en "\e]PE3b3f45" # ciemno szary
    echo -en "\e]PF294040" # base3 tokionight tekst w tty
    clear
end
# dotychczasowe ciemnozielone: 02181f 
# nieco ciemniejsze: 16211d
