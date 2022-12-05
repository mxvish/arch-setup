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
#mount /dev/nvme0n1p1 /mnt/efi
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
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime
hwclock --systohc

echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'kenter' > /etc/hostname
echo -e '
127.0.0.1\tlocalhost
::1\tlocalhost
127.0.0.1\tkenter.localdomain\tkenter' >> /etc/hosts

pacman -Syu --noconfirm dhcpcd dialog efibootmgr grub ifplugd iwd netctl os-prober wpa_supplicant
useradd -G wheel,audio,video -m kenter
passwd kenter
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
passwd
exit

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

reboot
