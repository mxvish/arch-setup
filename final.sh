mv config  .config/i3/
sudo mv i3status.conf /etc/
mkdir -p ~/.config/xfce4/terminal
mv terminalrc > ~/.config/xfce4/terminal/
mv vimrc ~/.vimrc

#make display scale larger
echo 'Xft.dpi: 120' > ~/.Xresources

flatpak install -y brave

reboot
