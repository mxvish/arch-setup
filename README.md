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
  mv arch-setup/* ~
  sh archinstall.sh
  exit
  reboot
  ```
  - Change username from `kenter` as you like.
  - This script does not format, mount partitions, and connect to wifi automatically.
  Refer to commented out commands in [archinstall.sh](archinstall.sh) to do them.

- Install i3 and others
  ```sh
  su
  sh archsetup.sh
  ```
  - For more information about what this command does, see [archsetup.sh](archsetup.sh).
  
# How to Enable Touchpad

(This is operated by executing [archsetup.sh](archsetup.sh).)
1. (This can be skipped)Change the below line of touchpad driver configuration shown by running `xinput` command.
  
   Before:
   ```sh
   libinput Tapping Enabled (340): 0
   ```
   After:
    ```sh
   libinput Tapping Enabled (340): 1
   ```

2. Edit `/etc/default/grub` file.

   Before:
   ```sh
    GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
    ```
   After:
   ```sh
    GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet psmouse.synaptics_intertouch=1"
    ```
 
3. Run the following command. (This will reboot the operating system.)
    ```sh
    grub-mkconfig -o /boot/grub/grub.cfg; systemctl reboot -i
    ```
  
Reference: https://linuxhint.com/change_mouse_touchpad_settings_xinput_linux/
