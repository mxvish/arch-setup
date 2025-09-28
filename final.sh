systemctl enable bluetooth.service 
systemctl start bluetooth.service 

mkdir -p /home/$HOSTNAME/.config/sway
#cp /etc/sway/config /home/$HOSTNAME/.config/sway

#sed -i 's/foot/lxterminal/' /home/$HOSTNAME/.config/sway/config

git clone https://github.com/mxvish/i3config.git
cd i3config
mv config /home/$HOSTNAME/.config/sway/
sudo mv i3status.conf /etc/

wget -q https://raw.githubusercontent.com/mxvish/dotfiles/main/.vimrc
mv .vimrc /home/$HOSTNAME/.vimrc

wget -q https://raw.githubusercontent.com/mxvish/dotfiles/main/init.el
mkdir -p /home/$HOSTNAME/.emacs.d/
mv init.el /home/$HOSTNAME/.emacs.d/

pactl set-source-mute @DEFAULT_SOURCE@ toggle

sed -i  's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

sed -i 's/Monospace 10/Monospace 12/' .config/lxterminal/lxterminal.conf
sed -i 's/hidemenubar=false/hidemenubar=true/' .config/lxterminal/lxterminal.conf
sed -i 's/hidescrollbar=false/hidescrollbar=true/' .config/lxterminal/lxterminal.conf

npm install --global pnpm
git clone https://github.com/Vencord/Vesktop
cd Vesktop
pnpm i
ln -s /home/$HOSTNAME/Vesktop/dist/linux-unpacked/vesktop /usr/local/bin/vesktop

git clone --depth=1 https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim
#run :Copilot setup in vim

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
