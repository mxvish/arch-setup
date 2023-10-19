#enable wifi on startup
systemctl enable netctl-auto@wlan0.service

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

packages=(
	acpilight
	alsa-utils
	bash-completion
 	bluez
  	bluez-utils 
	dmenu
	emacs-nox
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
	jdk-openjdk
	make
	man
	neofetch
	network-manager-applet
	otf-ipafont
	polkit
 	pulseaudio
 	pulseaudio-bluetooth
  	r
	ranger
 	scrot
	sudo
	unzip
	vim
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

echo 'xrdb ~/.Xresources
exec i3' > .xinitrc

echo 'clear lock
clear control
keycode 66 = Control_L
add control = Control_L Control_R' > .Xmodmap

#for xampp
#pacman -Syu --noconfirm inetutils libxcrypt-compat

mv bashrc .bashrc
mv grub /etc/default/

mkdir /mnt/mx /mnt/usb
#mount /dev/nvme0n1p3 /mnt/mx for slackware?
grub-mkconfig -o /boot/grub/grub.cfg
#edit /boot/grub/grub.cfg like grub.cfg in this repo?

rm archinstall.sh archsetup.sh LICENSE README.md

xbacklight -set 20

reboot
