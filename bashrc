#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias 0='xrandr --output eDP-1 --brightness 0.04'
alias 1='xrandr --output eDP-1 --brightness 0.07'
alias 2='xrandr --output eDP-1 --brightness 0.15'
alias 5='xrandr --output eDP-1 --brightness 0.5'
function aw {
    local url="https://duckduckgo.com/?q=arch+wiki+"
    url+=${@}
    url+="&t=brave&ia=web"
    brave $url
}
alias b='brave'
alias ca='cat /sys/class/power_supply/BAT1/capacity'
alias dh='df -h'
alias f='free -m'
alias li='clisp'
alias ls='ls --color=auto'
alias md='sudo mount /dev/sda2 /mnt/usb'
alias mk='mkdir'
alias n='neofetch'
alias op='vim ~/.bashrc; source ~/.bashrc'
alias p='python3 -O'
alias r='ranger'
alias rr='rm -rf'
alias si='yay -Syu --noconfirm; sudo pacman -Syu --noconfirm'
alias sr='sudo pacman -R --noconfirm'
alias ud='sudo umount /dev/sda2'
alias v='vim'
alias vc='vim ~/.config/i3/config'
alias vv='vim ~/.vimrc'
alias x='xdg-open'
alias xc='xclip -sel c <'

PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"
PS1='\W \# $'

xmodmap ~/.Xmodmap
xrdb ~/.Xresources
xrandr --output eDP-1 --brightness 0.2
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output HDMI-1 --rotate left
