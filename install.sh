#rmmod pcspkr # disable to beep on error

#fdisk -l
#cfdisk /dev/nvme0n1 #if SSD or HDD is /dev/nvme0n1

#(create / partition(type=linux) and remenber device name)
#(for example)
#
#root partition:  /dev/nvme0n1p5
#efi system: /dev/nvme0n1p1
#

#Format & mount partitions
#mkfs.ext4 /dev/nvme0n1p5
#mount /dev/nvme0n1p5 /mnt
#mkdir /mnt/efi
## if command below doesn't work
## mkfs.vfat -F32 /dev/nvme0n1p1
#mount /dev/nvme0n1p1 /mnt/efi

#when wlan is disabled
#rfkill unblock wlan
#ip link set wlan0 up

#iwctl
#station wlan0 get-networks
#station wlan0 connect aterm*g
#(enter password)
#exit
#ip a

isfullinstallation=true

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Japan /etc/localtime
hwclock -w

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'mxvish' > /etc/hostname
echo -e "
127.0.0.1\tlocalhost
::1\t\tlocalhost
127.0.0.1\t$HOSTNAME.localdomain\t$HOSTNAME" >> /etc/hosts

pacman -Syu --noconfirm dhcpcd dialog efibootmgr grub ifplugd iwd os-prober vim
useradd -G wheel,audio,video -m $HOSTNAME
passwd $HOSTNAME
grub-install --target=x86_64-efi --efi-directory=/efi/
sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
echo 'GRUB_CMDLINE_LINUX_DEFAULT="psmouse.synaptics_intertouch=1 quiet snd-hda-intel.model=dell-headset-multi"' >> /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg
passwd

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

fullinstall(){
  packages=(
  	acpilight
  	bash-completion
  	blueman
  	brightnessctl
  	btop
  	dmenu
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
  	i3-wm
  	i3lock
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
   	tree
  	unzip
  	wget
    xclip
  	xorg-server
  	xorg-xinit
    xterm
   )
  
  for i in "${packages[@]}"; do pacman -Syu --noconfirm "$i"; done
  
  mkdir /mnt/usb
  mkdir /etc/X11/xorg.conf.d
  
  echo 'Section "InputClass"
       Identifier "libinput touchpad catchall"
       MatchIsTouchpad "on"
       MatchDevicePath "/dev/input/event*"
       Option "Tapping" "True"
       Option "TappingDrag" "True"
       Driver "libinput"
  EndSection' > /etc/X11/xorg.conf.d/40-libinput.conf
}

if [ $isfullinstallation ]; then
    fullinstall
fi

exit
reboot
