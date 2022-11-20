pacman -Syu --noconfirm alsa-utils bash-completion dmenu fcitx fcitx-configtool fcitx-mozc git i3-wm i3lock i3status jdk-openjdk man network-manager-applet otf-ipafont sudo unzip vim vlc xfce4-terminal xorg-server xorg-xinit xterm
echo -e 'if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
\texec startx
fi' >> .bash_profile

echo 'exec i3' > .xinitrc

echo 'clear lock
clear control
keycode 66 = Control_L
add control = Control_L Control_R' > .Xmodmap

#enable wifi on startup
systemctl enable netctl-auto@$(ip r | cut -d " " -f 5 | head -n 1).service
#hide xfce4-terminal scrollbar by default
echo 'MiscMenubarDefault=FALSE' >> ~/.config/xfce4/terminal/terminalrc 
#make display scale larger
echo 'Xft.dpi: 120' > ~/.Xresources
xrdb .Xresources 

#for xampp
pacman -Syu --noconfirm inetutils libxcrypt-compat

mv vimrc ~/.vimrc
