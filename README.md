# arch-setup
Installer &amp; setup script for Arch Linux in i3 on UEFI x86-64 pc

# Usage
- Install Arch on PC
  ```sh
  #After creating partitions, mounting partitions and connecting to the Internet.
  pacstrap /mnt base linux linux-firmware git
  genfstab -U /mnt >> /mnt/etc/fstab
  arch-chroot /mnt
  git clone https://github.com/mxvish/arch-setup.git
  cd arch-setup
  sh archinstall.sh
  exit
  reboot
  ```
  - Change username from `mxvish` as you like.
  - This script does not format, mount partitions, and connect to wifi automatically.
  Refer to commented out commands in [archinstall.sh](archinstall.sh) to do them.

- Install i3 and others
  ```sh
  su
  sh archsetup.sh
  sh final.sh
  ```
  - For more information about what this command does, see [archsetup.sh](archsetup.sh) and [final.sh](final.sh).
