#setup for wifi
systemctl enable iwd.service
systemctl start iwd.service
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service

echo '
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd' > /etc/iwd/main.conf

packages=(
	acpilight
	bash-completion
 	bluez
  	bluez-utils 
	dmenu
 	exfatprogs
	fcitx
	fcitx-configtool
	fcitx-mozc
	feh
 	gcc
	git
	i3-wm
	i3lock
	i3status
	make
	man
	neofetch
	otf-ipafont
	polkit
 	pulseaudio
 	pulseaudio-bluetooth
  	r
	ranger
 	scrot
	sudo
	unzip
	vivaldi
	wget
	xclip
	xfce4-terminal
	xorg-server
	xorg-xinit
	xorg-xrandr
	xterm)

for i in "${packages[@]}"; do pacman -Syu --noconfirm "$i"; done

systemctl enable bluetooth.service
systemctl start bluetooth.service

echo -e 'if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
\texec startx
fi' >> .bash_profile

echo 'exec i3' > .xinitrc

#for xampp
#pacman -Syu --noconfirm inetutils libxcrypt-compat

mv bashrc .bashrc

mkdir /mnt/usb

echo 'Section "InputClass"
     Identifier "libinput touchpad catchall"
     MatchIsTouchpad "on"
     MatchDevicePath "/dev/input/event*"
     Option "Tapping" "True"
     Option "TappingDrag" "True"
     Driver "libinput"
EndSection' > /etc/X11/xorg.conf.d/40-libinput.conf

rm archinstall.sh archsetup.sh LICENSE README.md

mkdir -p /usr/local/share/kbd/keymaps/
echo 'keycode 58 = Control' > /usr/local/share/kbd/keymaps/custom.map

reboot
