mv config  .config/i3/
sudo mv i3status.conf /etc/
mv vimrc ~/.vimrc

#make display scale larger
echo 'Xft.dpi: 120' > ~/.Xresources

pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
yay -S --noconfirm brave-bin

reboot
