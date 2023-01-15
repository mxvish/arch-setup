# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias 0='xrandr --output eDP-1 --brightness 0.04'
alias 1='xrandr --output eDP-1 --brightness 0.07'
alias 2='xrandr --output eDP-1 --brightness 0.15'
alias 4='xrandr --output eDP-1 --brightness 0.3'
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
function i {
    local url="https://duckduckgo.com/?q=wiki+"
    url+=${@}
    url+="&t=brave&ia=web"
    brave $url
}
alias li='clisp'
alias ls='ls --color=auto'
alias md='sudo mount /dev/sda2 /mnt/usb'
alias mk='mkdir'
alias n='neofetch'
alias op='vim ~/.zshrc; source ~/.zshrc'
alias p='python3 -O'
alias po='systemctl poweroff'
alias r='ranger'
alias re='systemctl reboot -i'
alias rr='rm -rf'
alias si='yay -Syu --noconfirm; sudo pacman -Syu --noconfirm'
alias sr='sudo pacman -R --noconfirm'
alias ud='sudo umount /dev/sda2'
alias v='vim'
alias va='vim ~/a; xc ~/a'
alias vc='vim ~/.config/i3/config'
alias vv='vim ~/.vimrc'
alias x='xdg-open'
alias xc='xclip -sel c <'

precmd() {print ""}
PS1='%1~ $'

xrdb ~/.Xresources
xrandr --output eDP-1 --brightness 0.2
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output HDMI-1 --rotate left
