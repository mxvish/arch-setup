# How to Enable Touchpad

1. Change the below line of touchpad driver configuration shown by running `xinput` command.
  
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
