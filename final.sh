rfkill unblock bluetooth
systemctl enable bluetooth.service 
systemctl start bluetooth.service 

chown -R $HOSTNAME:$HOSTNAME /home/$HOSTNAME/

echo 'exec i3' > /home/$HOSTNAME/.xinitrc

#mkdir -p /home/$HOSTNAME/.config/sway
##cp /etc/sway/config /home/$HOSTNAME/.config/sway

#sed -i 's/foot/lxterminal/' /home/$HOSTNAME/.config/sway/config

git clone https://github.com/mxvish/i3config.git
cd i3config
#mv config /home/$HOSTNAME/.config/sway/
mv config /home/$HOSTNAME/.config/i3/
sudo mv i3status.conf /etc/

wget -q https://raw.githubusercontent.com/mxvish/dotfiles/main/.vimrc
mv .vimrc /home/$HOSTNAME/.vimrc

wget -q https://raw.githubusercontent.com/mxvish/dotfiles/main/init.el
mkdir -p /home/$HOSTNAME/.emacs.d/
mv init.el /home/$HOSTNAME/.emacs.d/

pactl set-source-mute @DEFAULT_SOURCE@ toggle
pactl set-card-profile $(pactl list cards | grep " bluez_card" | cut -d " " -f 2) headset-head-unit

sed -i  's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

lxterminal

sed -i 's/Monospace 10/Monospace 12/' /home/$HOSTNAME/.config/lxterminal/lxterminal.conf
sed -i 's/hidemenubar=false/hidemenubar=true/' /home/$HOSTNAME/.config/lxterminal/lxterminal.conf
sed -i 's/hidescrollbar=false/hidescrollbar=true/' /home/$HOSTNAME/.config/lxterminal/lxterminal.conf

cd /home/$HOSTNAME/
npm install --global pnpm
git clone https://github.com/Vencord/Vesktop
cd Vesktop
pnpm i
pnpm package --linux pacman
ln -s /home/$HOSTNAME/Vesktop/dist/linux-unpacked/vesktop /usr/local/bin/vesktop

git clone --depth=1 https://github.com/github/copilot.vim.git \
  /home/$HOSTNAME/.vim/pack/github/start/copilot.vim
#run :Copilot setup in vim

wget -q https://raw.githubusercontent.com/mxvish/dotfiles/main/00-keyboard.conf
mv 00-keyboard.conf /etc/X11/xorg.conf.d/

reboot
:'
fcitx
    fcitx-config-gtk3
        input method
            add mozc
        global config
            trigger input method
      
firefox
    fonts -> fonts for latin
        serif      : FreeSerif
        sans-serif : FreeSans
'
