#setup for wifi
systemctl enable dhcpcd.service
systemctl start dhcpcd.service
systemctl enable iwd.service
systemctl start iwd.service
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service

echo '[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd' > /etc/iwd/main.conf

packages=(
	acpilight
	bash-completion
 	blueberry
 	bluez
  	bluez-utils
	brightnessctl
 	emacs-nox
 	exfatprogs
	fcitx
	fcitx-configtool
	fcitx-mozc
	feh
 	firefox
 	gcc
	git
 	i3status
 	lxterminal
	make
	man
 	nasm
	otf-ipafont
	polkit
 	pulseaudio
 	pulseaudio-bluetooth
  	qemu-desktop
   	r
	ranger
 	scrot
	sudo
 	sway
 	swaylock
 	tree
	unzip
	wget
 	wmenu
	xclip
 	xorg-server
 )

for i in "${packages[@]}"; do pacman -Syu --noconfirm "$i"; done

echo -e 'if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
\texec startx
fi' >> /home/$HOSTNAME/.bash_profile

echo 'exec i3' > /home/$HOSTNAME/.xinitrc

mv bashrc /home/$HOSTNAME/.bashrc
chown $HOSTNAME:$HOSTNAME /home/$HOSTNAME/.bashrc
 
mkdir /mnt/usb

echo 'Section "InputClass"
     Identifier "libinput touchpad catchall"
     MatchIsTouchpad "on"
     MatchDevicePath "/dev/input/event*"
     Option "Tapping" "True"
     Option "TappingDrag" "True"
     Driver "libinput"
EndSection' > /etc/X11/xorg.conf.d/40-libinput.conf

#rm archinstall.sh archsetup.sh LICENSE README.md

mkdir -p /usr/local/share/kbd/keymaps/
echo 'keycode 58 = Control' > /usr/local/share/kbd/keymaps/custom.map

reboot
