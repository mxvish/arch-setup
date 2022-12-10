mv config  .config/i3/
sudo mv i3status.conf /etc/
mkdir -p ~/.config/xfce4/terminal
mv terminalrc > ~/.config/xfce4/terminal/
mv vimrc ~/.vimrc

pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
yay -S --noconfirm brave-bin
