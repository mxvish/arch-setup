mv config  .config/i3/
sudo mv i3status.conf /etc/
mv vimrc ~/.vimrc

#make display scale larger
echo 'Xft.dpi: 120' > ~/.Xresources

pacman -Syu --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay-bin.git
sudo chown $(whoami):$(whoami) yay-bin
cd yay-bin
makepkg -si --noconfirm
yay -S --noconfirm brave-bin

curl -fLos ~/.emacs.d/init.el --create-dirs https://raw.githubusercontent.com/mxvish/init.el/main/init.el

wget https://raw.githubusercontent.com/mxvish/GUI-timer/main/cd.java
wget https://raw.githubusercontent.com/00xBAD/arch-logo/main/arch_outline.png

reboot
:'
brave
    appearance
        brave colors = dark
    new tab page = blank
    Settings -> appearance -> customize fonts, choose FreeSans
    Uncheck 
        appeareance
            show bookmarks = never
            show bookmarks button
            show brave news button ~
            show autocpmplete suggestions ~
            show tab search button
            show sidebar button
        brave rewards
            show brave rewards ~
            show tip buttons ~
        social media blocking
            google
        privacy and security
            clear browsing data
                on exit
                    browsing
                    download
                    cached ~
                    autofill form
            site and shields ~
                location
                    do not allow
                notification
                    do not allow
        web3
            show brave wallet icon ~
    check
        system
            memory saver
                
'
