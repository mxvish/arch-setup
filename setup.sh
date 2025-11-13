packages=(
	acpilight
	bash-completion
	blueman
	brightnessctl
 	emacs-nox
 	exfatprogs
	fcitx5
	fcitx5-configtool
	fcitx5-gtk
	fcitx5-mozc
	feh
 	firefox
 	gcc
	git
 	i3status
 	lxterminal
	make
	man
 	nasm
	npm
	noto-fonts-emoji
	otf-ipafont
	pipewire
	pipewire-pulse
	polkit
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
	wl-clipboard
	xorg-xwayland
 )

for i in "${packages[@]}"; do pacman -Syu --noconfirm "$i"; done

echo -e 'if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
\texec sway
fi' >> /home/$HOSTNAME/.bash_profile

mv .bashrc /home/$HOSTNAME/
chown -R $HOSTNAME:$HOSTNAME /home/$HOSTNAME/
 
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

reboot
