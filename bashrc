#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias 0='xrandr --output eDP-1 --brightness 0.05'
alias 1='xrandr --output eDP-1 --brightness 0.1'
alias 2='xrandr --output eDP-1 --brightness 0.15'
alias 5='xrandr --output eDP-1 --brightness 0.5'
alias b='brave'
alias ca='cat /sys/class/power_supply/BAT1/capacity'
alias f='free -m'
alias i='pacman -Syu --noconfirm'
alias ls='ls --color=auto'
alias mk='mkdir'
alias n='neofetch'
alias op='vim ~/.bashrc; source ~/.bashrc'
alias r='ranger'
alias re='systemctl reboot -i'
alias rr='rm -rf'
alias si='sudo pacman -Syu --noconfirm'
alias sr='sudo pacman -R --noconfirm'
alias v='vim'
alias vc='vim ~/.config/i3/config'
alias vv='vim ~/.vimrc'
alias x='xdg-open'
alias xc='xclip -sel c <'
alias xe='xrandr --output eDP-1 --brightness'

PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"
PS1='\W \$'

feh --bg-fill arch-wallpaper.jpg

xrandr --output eDP-1 --brightness 0.25
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output HDMI-1 --rotate left
xrdb ~/.Xresources

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
