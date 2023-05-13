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

curl -fLos ~/.emacs.d/init.el --create-dirs https://raw.githubusercontent.com/mxvish/init.el/main/init.el

wget https://raw.githubusercontent.com/mxvish/GUI-timer/main/cd.java
wget https://raw.githubusercontent.com/00xBAD/arch-logo/main/arch_outline.png

reboot

#change brave font to FreeSans by Settings -> appearance -> customize fonts
