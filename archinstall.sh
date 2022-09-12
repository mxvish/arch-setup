fdisk -l
cfdisk /dev/nvme0n1 #if SSD or HDD is /dev/nvme0n1
#(create / and swap partition(type=linux swap) and remenber device name)
#(for example)
#
#root partition:  /dev/nvme0n1p5
#swap partition: /dev/nvme0n1p6
#efi system: /dev/nvme0n1p1
#

#Format & mount partitions
#mkfs.ext4 /dev/nvme0n1p5
#mkswap /dev/nvme0n1p6
#swapon /dev/nvme0n1p6
#mount /dev/nvme0n1p5 /mnt
#mkdir /mnt/efi
#mount -o remount,size=1G /run/archiso/cowspace

iwctl
#station wlan0 get-networks
#station wlan0 connect aterm*g
#(enter password)
#exit
ip a

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localetime
hwclock --systohc

echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'kenter' > /etc/hostname
echo -e '
127.0.0.1\tlocalhost
::1\tlocalhost
127.0.0.1\tkenter.localdomain\tkenter' >> /etc/hosts

pacman -Syu netctl dialog dhcpcd wpa_supplicant ifplugd grub efibootmgr os-prober --noconfirm
useradd -G wheel,audio,video -m kenter
passwd kenter
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
passwd
exit
reboot

pacman -Syu --noconfirm alsa-utils chrome dmenu fcitx fcitx-configtool fcitx-mozc git i3-wm i3lock i3status man  otf-ipafont sudo vim xfce4-terminal xorg-server xorg-xinit xterm
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
