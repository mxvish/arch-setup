packages=(
	acpilight
	bash-completion
	blueman
	brightnessctl
	btop
 	emacs-nox
 	exfatprogs
	fastfetch
	fcitx5
	fcitx5-configtool
	fcitx5-gtk
	fcitx5-mozc
	feh
 	firefox
 	gcc
	git
	grim
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
	sudo
 	sway
 	swaylock
 	tree
	unzip
	wget
 	wmenu
	wl-clipboard
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xorg-xwayland
 )

for i in "${packages[@]}"; do pacman -Syu --noconfirm "$i"; done

#echo -e 'if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
#\texec sway
#fi' >> /home/$HOSTNAME/.bash_profile

echo 'if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi' > >> /home/$HOSTNAME/.bash_profile

echo 'exec i3' > /home/$HOSTNAME/.xinitrc

mv .bashrc /home/$HOSTNAME/
 
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
