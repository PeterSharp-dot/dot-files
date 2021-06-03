# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
#Vim mode in bash: activate it with <Escape> key
#set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#info about uninstalled commands:
#source /usr/share/doc/pkgfile/command-not-found.bash

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export TERM=xterm-256color

#color support for less and man pages:
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

GPG_TTY=$(tty)
export GPG_TTY
export MANWIDTH=80
export STARDICT_DATA_DIR="/home/peter/sdcv/"
export PATH="$PATH:/home/peter/.local/bin"
export PATH="$PATH:/home/peter/.local/lib"
export PATH="$PATH:/var/tmp/portage/x11-terms/alacritty-0.7.1/image/usr/bin"
export TERMINAL="/usr/bin/termite"
export EDITOR=vim
export VISUAL=vim
export MANPAGER='less -s -M +Gg'
export FZF_DEFAULT_COMMAND='ag --hidden --depth 4 --ignore .git -g ""'

#export PATH="$PATH:/home/peter/AUR-dir/fff/"
# Example setup (bash) (in .bashrc)
#f() { fff "$@"; cd "$(< ~/.fff_d)"; }

# Customization (temporary file to use)
# Default: '${XDG_CACHE_HOME}/fff/fff.d'
#          If not using XDG, '${HOME}/.cache/fff/fff.d' is used.
#export FFF_CD_FILE=~/.fff_d

#function ranger-cd {
#    tempfile="$(mktemp -t tmp.XXXXXX)"
#    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
#    test -f "$tempfile" &&
#    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
#        cd -- "$(cat "$tempfile")"
#    fi
#    rm -f -- "$tempfile"
#}

# New colors for tty
#if [ "$TERM" = "xterm-256color" ]; then
#    echo -en "\e]PFEDEDED" #white
#    echo -en "\e]P82B2B2B" #darkgrey
#    echo -en "\e]P1D75F5F" #darkred
#    echo -en "\e]P9E33636" #red
#    echo -en "\e]P287AF5F" #darkgreen
#    echo -en "\e]PA98E34D" #green
#    echo -en "\e]P3D7AF87" #brown
#    echo -en "\e]PBFFD75F" #yellow
#    echo -en "\e]P48787AF" #darkblue
#    echo -en "\e]PC7373C9" #blue
#    echo -en "\e]P5BD53A5" #darkmagenta
#    echo -en "\e]PDD633B2" #magenta
#    echo -en "\e]P65FAFAF" #darkcyan
#    echo -en "\e]PE44C9C9" #cyan
#    echo -en "\e]P7E5E5E5" #lightgrey
#    echo -en "\e]P0000000" #black
#    clear #for background artifacting
#fi
if [ "$TERM" = "xterm-256color" ]; then
    echo -en "\e]PB657b83" # base00
    echo -en "\e]PA586e75" # base01
    echo -en "\e]P0073642" # base02
    echo -en "\e]P62aa198" # cyan
    echo -en "\e]P8002b36" # base03
    echo -en "\e]P2859900" # green
    echo -en "\e]P5d33682" # magenta
    echo -en "\e]P1dc322f" # red
    echo -en "\e]PC839496" # base0
    echo -en "\e]PE93a1a1" # base1
    echo -en "\e]P9cb4b16" # orange
    echo -en "\e]P7eee8d5" # base2
    echo -en "\e]P4268bd2" # blue
    echo -en "\e]P3b58900" # yellow
    echo -en "\e]PFfdf6e3" # base3
    echo -en "\e]PD6c71c4" # violet
    clear
fi


# This binds Ctrl-O to ranger-cd:
#bind '"\C-o":"ranger-cd\C-m"'

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#alias la='ls -a'
alias lal='ls -al'
alias listen='mpv --no-video --loop-playlist'
alias duch='du -d 1 -h | sort -r -h'
alias v='mpv'
#alias ran='ranger-cd'


#bind '"\C-[":"pactl set-sink-volume @DEFAULT_SINK@ -1000\C-m"'
#bind '"\C-]":"pactl set-sink-volume @DEFAULT_SINK@ +1000\C-m"'



#PS1='[\u@\h \W]\$ '

#-------------------------------
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

PS1="${GREEN}my prompt${RESET}> "
#-------------------------------
PS1="$BOLD${GREEN}»»${RESET} \u$BOLD${GREEN} »» ${RESET}\W$BOLD/ ${GREEN}»»${RESET} "
PS1="\W$BOLD/ ${GREEN}»${RESET} "

# export LC_ALL=C

# settings for ripgrep & fzf:
#if type rg &> /dev/null; then
##  export FZF_DEFAULT_COMMAND='rg --files'
#  export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
#  export FZF_DEFAULT_OPTS='-m --height 50% --border'
#fi


# vicd()
# {
#     dst="$(command vifm --choose-dir - "$@")"
#     if [ -z "$dst" ]; then
#         echo 'Directory picking cancelled/failed'
#         return 1
#     fi
#     cd "$dst"
# }
# bind '"\C-u":"vicd\C-m"'

#$RANGERCD && unset RANGERCD 

open_with_fzf(){
    cd $HOME && fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}

cd_with_fzf() {
    cd $HOME && cd "$(fd -t d -H -I | fzf --preview="tree -L 1 {}"
    --bind="space:toggle-preview" --preview-window=:hidden)" && clear && t
}

bind '"\C-f":"cd_with_fzf\C-m"'
bind '"\C-o":"open_with_fzf\C-m"'

#source /usr/share/fzf/key-bindings.bash
#source /usr/share/fzf/completion.bash

#exec zsh

source /home/peter/.config/broot/launcher/bash/br
