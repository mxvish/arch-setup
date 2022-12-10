pacman -Syu --noconfirm alsa-utils bash-completion dmenu fcitx fcitx-configtool fcitx-mozc git i3-wm i3lock i3status jdk-openjdk man network-manager-applet otf-ipafont polkit ranger scrot sudo unzip vim vlc xfce4-terminal xorg-server xorg-xinit xterm
echo -e 'if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
\texec startx
fi' >> .bash_profile

echo 'exec i3' > .xinitrc

echo 'clear lock
clear control
keycode 66 = Control_L
add control = Control_L Control_R' > .Xmodmap

#enable wifi on startup
#systemctl enable netctl-auto@$(ip r | cut -d " " -f 5 | head -n 1).service

#setup for wifi
systemctl enable iwd.service
systemctl start iwd.service
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service
systemctl enable NetworkManager.service
systemctl start NetworkManager.service

echo '
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd' > /etc/iwd/main.conf

#make display scale larger
echo 'Xft.dpi: 120' > ~/.Xresources
xrdb .Xresources 

#for xampp
#pacman -Syu --noconfirm inetutils libxcrypt-compat

mv bashrc .bashrc
#mv config  .config/i3/
mv grub /etc/default/
#sudo mv i3status.conf /etc/
#mkdir -p ~/.config/xfce4/terminal
#mv terminalrc > ~/.config/xfce4/terminal/
#mv vimrc ~/.vimrc

grub-mkconfig -o /boot/grub/grub.cfg
#edit /boot/grub/grub.cfg like grub.cfg in this repo

rm archinstall.sh archsetup.sh LICENSE README.md

reboot
