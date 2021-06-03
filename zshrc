autoload -U compinit promptinit
compinit
promptinit 
#prompt bart
#export PS1="[%~] %B>%b "
PROMPT='%F{blue}%B>%b%f '
RPROMPT='[%F{magenta}%~%f] [%F{yellow}%?%f]'
#unsetopt correctall
#DISABLE_CORRECTION="true"
zstyle ':completion::complete:*' use-cache 0
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b' 
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_space
setopt autocd
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

# vim mode config
    # ---------------

    # Activate vim mode.
#    bindkey -v

    # Remove mode switching delay.
    KEYTIMEOUT=5

    # Change cursor shape for different vi modes.
    function zle-keymap-select {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select

#                # Use beam shape cursor on startup.
#                echo -ne '\e[5 q'
#
#                # Use beam shape cursor for each new prompt.
#                preexec() {
#                   echo -ne '\e[5 q'
#                }
fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

#Exports:
export TERM=xterm-256color
GPG_TTY=$(tty)
export GPG_TTY
export MANWIDTH=80
export STARDICT_DATA_DIR="/home/peter/sdcv/"
export PATH="$PATH:/home/peter/.local/bin"
export PATH="$PATH:/home/peter/.local/lib"
export PATH="$PATH:/home/peter/.cargo/bin"
export TERMINAL="/usr/bin/alacritty"
export BROWSER=firefox
export SHFM_OPENER="/home/peter/.local/bin/shfm-opener.sh"
export EDITOR=vim
export VISUAL=vim
export FZF_DEFAULT_COMMAND='ag --hidden --depth 4 --ignore .git -f -g ""'

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

#if [ "$TERM" = "xterm-256color" ]; then
    #echo -en "\e]PBdddddd" # base00
    #echo -en "\e]PAeaeaea" # base01
    #echo -en "\e]P0ffffff" # base02
    #echo -en "\e]P62aa198" # cyan
    #echo -en "\e]P8cccccc" # base03
    #echo -en "\e]P2859900" # green
    #echo -en "\e]P5d33682" # magenta
    #echo -en "\e]P1dc322f" # red
    #echo -en "\e]PC458d83" # base0 folders, comments, prompt
    #echo -en "\e]PE525252" # base1 
    #echo -en "\e]P9cb4b16" # orange
    #echo -en "\e]P7666666" # base2 font
    #echo -en "\e]P4268bd2" # blue
    #echo -en "\e]P3b58900" # yellow
    #echo -en "\e]PF777777" # base3
    #echo -en "\e]PD6c71c4" # violet
    #clear
#fi
sf(){
    fd -H -I -t f | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}
sd() {
    cd $HOME && cd "$(fd -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && pwd && tree -L 1
}
zle -N sf{,}
zle -N sd{,}
bindkey  ^f sd
bindkey  ^o sf

#Aliases:
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias ls='lsd'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# #-------------------------------
# GREEN="\[$(tput setaf 2)\]"
# RESET="\[$(tput sgr0)\]"
# BOLD="\[$(tput bold)\]"
# 
# PS1="${GREEN}my prompt${RESET}> "
# #-------------------------------
# PS1="$BOLD${GREEN}»»${RESET} \u$BOLD${GREEN} »» ${RESET}\W$BOLD/ ${GREEN}»»${RESET} "
# PS1="\W$BOLD/ ${GREEN}»${RESET} "

alias m='free -h'
alias suspend='sudo loginctl suspend'
alias susp='sudo loginctl suspend'
alias arch7='7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -p'
#alias rklog='less /var/log/rkhunter.log | grep Warning' 
alias psudo='pass -c misc/sudo'
alias pgmail='pass -c webs/google/peter.grela@gmail.com'
alias pface='pass -c webs/facebook/gmail'
alias pallegro='pass -c webs/allegro.pl/petrosg'
alias ponet='pass -c webs/poczta.onet.pl/piotrgre@poczta.onet.pl'
alias ptwit='pass -c webs/twitter/gmail'
#alias pirssi='pass -c webs/irssi/l:PeterSharp'
#alias mp='mplayer'
#alias youv='/home/peter/bin/youtube-mplayer'
alias balias='vi /home/peter/.bash_aliases'
alias onet='w3m www.onet.pl'
alias google='w3m www.google.pl'
alias wid='cd /home/peter/videos && ls /home/peter/videos'
alias doc='cd /home/peter/docs && clear && tree -L 1 /home/peter/docs'
alias dow='cd /home/peter/Downloads && ls /home/peter/Downloads'
alias mus='cd /home/peter/music && t /home/peter/music'
alias upd='sudo emerge --color y -auDUN --exclude=firefox --exclude=qtwebengine --with-bdeps=y @world'
#alias upd='psudo && sudo emerge -auDUN --with-bdeps=y @world'
#alias sy='psudo && sudo emerge --sync'
#alias cl='psudo && sudo emerge -cav'
alias sy='sudo eix-sync'
alias cl='sudo emerge -cav'
alias def='sdcv -c'
#alias keys='elinks /home/peter/Dokumenty/Kde\ Shortkeys/kbd.html'
alias youm='youtube-dl --config-location /home/peter/.config/youtube-dl/listen.conf'
alias parti='cd /mnt && ls'
#alias clamav='clamscan -ri --log=/home/peter/.clamav-log/clamscan.log  --copy=/home/peter/.clamav-log/base/ --phishing-scan-urls --algorithmic-detection --normalize --scan-pe --scan-elf --scan-ole2 --scan-pdf --scan-swf --scan-html --scan-xmldocs --scan-archive'
alias metatrader='wine /home/peter/.wine/drive_c/Program\ Files/MetaTrader\ 5/terminal64.exe'
#alias sedpl='/usr/bin/sed -f /home/peter/bin/pl.sed'
alias i3c='vi /home/peter/.config/i3/config'
#alias kc='killall -10 conky'
alias scrot='scrot -u -d 5'
#alias vinfo='zathura /home/peter/Dokumenty/Informatyka/vim_learning/quick-vim.pdf'
alias con='cd /home/peter/.config/ && ls /home/peter/.config/'
alias ter='cd /home/peter/.config/termite && vi /home/peter/.config/termite'
#alias eu='watch -n 10 -t eur'
alias w3mt='stty cols 80 && w3m -F -s -o auto_image=TRUE'
#alias w3m='w3m -F -s'
#alias lampp='sudo /opt/lampp/lampp'
alias feh='feh -.'
alias pogoda='cal && curl -Ss wttr.in | sed -e "s/5;226m/5;208m/g" -e "s/5;190m/5;208m/g"'
#alias irssi='irssi -c chat.freenode.net -n PeterSharp' 
alias zegar='watch -n 1 /home/peter/bin/zegar'
alias neo='neomutt'
alias less='less -R'
alias pgithub='pass -c webs/github/PeterSharp-dot'
alias ark='soffice --calc'
alias wri='soffice --writer'
alias l1='ls -1'
alias sensors='watch -n 2 -t sensors'
#alias mine='java -jar /home/peter/minecraft/linux_osx/Shiginima\ Launcher\ SE.v4400.jar'
#alias tetris='bastet'
alias news='newsboat'
#alias pakman='myman'
alias disks='df -h | grep ^/dev'
alias ...='devour'
alias search='grep -rnw' 
alias py='python'
alias rsync='rsync --progress'
alias mmpv='mpv --no-audio-display'
alias fdi='find . -iname '
alias se='vim $(fzf)'
alias dwmf='clear && cd ~/dwm-6.2 && ls ~/dwm-6.2'
alias dwmupd='psudo && sudo make clean install'
alias pra='clear && cd /home/peter/docs/Praca/ && ls -1 /home/peter/docs/Praca'
alias deu='cd /home/peter/docs/deutsch-lernen && ls -1 /home/peter/docs/deutsch-lernen'
alias notes='cd /home/peter/notes/ && nvim /home/peter/notes/index.md'
alias note='cd /home/peter/notes/ && nvim /home/peter/notes/index.md'
alias lo='cd /home/peter/.local && ls -1 /home/peter/.local'
alias bi='cd /home/peter/.local/bin && ls -1 /home/peter/.local/bin'
alias dane='cd /mnt/dane/home/peter/'
alias t='clear && pwd && tree -L 1'
alias cpr='cd ~/docs/c-programming/ && clear && tree -L 1 ~/docs/c-programming/'
alias sc='sc-im'
alias vimrc='vim ~/.vim/vimrc'
alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'
alias lal='ls -al'
alias listen='mpv --no-video --loop-playlist'
alias duch='du -d 1 -h | sort -r -h'
alias v='mpv'
alias sz='source $HOME/.zshrc'
alias ez='vim $HOME/.zshrc'
alias rm='rm -i'
alias s='systemctl'
alias j='journalctl -xe'
alias ho='cd ~ && clear' 
alias usb='cd /run/media/peter/ && t'
alias vi='vi -X'
#alias tmux='tmux -2'
alias nvim='/usr/local/bin/nvim'
alias ta='tmux attach -t0'

#bindkey -v


#source /home/peter/.config/broot/launcher/bash/br
