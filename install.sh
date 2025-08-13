#rmmid pcspkr # disable to beep on error

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

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Japan /etc/localtime
hwclock -w

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
#echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'mxvish' > /etc/hostname
echo -e '
127.0.0.1\tlocalhost
::1\t\tlocalhost
127.0.0.1\tmxvish.localdomain\tmxvish' >> /etc/hosts

pacman -Syu --noconfirm dhcpcd dialog efibootmgr grub ifplugd iwd os-prober vim
useradd -G wheel,audio,video -m mxvish
passwd mxvish
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
echo 'GRUB_DISABLE_OS_PROBER=false
GRUB_CMDLINE_LINUX_DEFAULT="psmouse.synaptics_intertouch=1 quiet snd-hda-intel.model=dell-headset-multi"' >> /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg
passwd
exit
reboot
