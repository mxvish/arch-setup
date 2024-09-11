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

#alias 0='xrandr --output eDP-1 --brightness 0.04'
#alias 1='xrandr --output eDP-1 --brightness 0.07'
#alias 2='xrandr --output eDP-1 --brightness 0.15'
#alias 3='xrandr --output eDP-1 --brightness 0.3'
#alias 10='xrandr --output eDP-1 --brightness 1'
alias 1='xbacklight -set 1;xrandr --output eDP-1 --brightness 0.15'
alias 5='xrandr --output eDP-1 --brightness 0.5'
function aw {
    local url="https://duckduckgo.com/?q=arch+wiki+"
	for arg in $@; do
		url+="$arg+"
	done
    brave $url
}
alias ca='cat /sys/class/power_supply/BAT1/capacity'
alias dh='df -h'
alias f='free -m'
function gw {
    local url="https://duckduckgo.com/?q=gentoo+wiki+"
	for arg in $@; do
		url+="$arg+"
	done
    brave $url
}
function i {
    url="https://duckduckgo.com/?q=wiki+"
	for arg in $@; do
		url+="$arg+"
	done
    brave $url
}
function ii {
	url="https://duckduckgo.com/?q=wiki+"
	for arg in $@; do
		url+="$arg+"
	done
	brave $url
	url+="+pixiv"
	brave $url
	url=`echo "$url" | sed 's/pixiv/dic.nicovideo/'`
	brave $url
}
alias li='clisp'
alias ls='ls --color=auto'
alias md='sudo mount /dev/sda2 /mnt/usb'
alias mk='mkdir'
#alias n='neofetch'
alias op='vim ~/.bashrc; source ~/.bashrc'
alias p='python3 -O'
alias r='ranger'
alias rr='rm -rf'
function sc {
    local url="https://scholar.google.com/scholar?q="
	for arg in $@; do
		url+="$arg+"
	done
    brave $url
}
alias si='yay -Sc --noconfirm; yay -Syu --noconfirm; sudo pacman -Sc --noconfirm; sudo pacman -Syu --noconfirm'
alias sr='sudo pacman -Qdtq | sudo pacman -Rs - --noconfirm; sudo pacman -R --noconfirm'
#alias sr='sudo pacman -Rns $(pacman -Qdtq) --noconfirm;sudo pacman -R --noconfirm'
alias ud='sudo umount /dev/sda2'
alias v='vim'
alias va='v ~/a; xc a'
alias vb='v ~/b; xc b'
alias vc='vim ~/.config/i3/config'
alias vv='vim ~/.vimrc'
alias x='xdg-open'
alias xc='xclip -sel c <'
alias xe='xrandr --output eDP-1 --brightness'

PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"
PS1='\W $'

#feh --bg-max ~/wallpaper.png
xbacklight -set 20
xmodmap .Xmodmap
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output HDMI-1 --rotate left
