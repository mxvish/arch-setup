mv config  .config/i3/
sudo mv i3status.conf /etc/
mv vimrc ~/.vimrc

#make display scale larger
mv Xresources ~/.Xresources
:'
pacman -Syu --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay-bin.git
sudo chown $(whoami):$(whoami) yay-bin
cd yay-bin
makepkg -si --noconfirm
yay -S --noconfirm brave-bin
'
wget https://raw.githubusercontent.com/mxvish/init.el/main/init.el
mkdir ~/.emacs.d/
mv init.el ~/.emacs.d/

wget https://raw.githubusercontent.com/mxvish/GUI-timer/main/cd.java

amixer set Master unmute
amixer set Speaker unmute
amixer set Headphone unmute

amixer set Master 40
amixer set Speaker 87
amixer set Headphone 87

reboot
:'
su
EDITOR=vim visudo
#uncomment line that begins with # %wheel

fcitx
    fcitx-config-gtk3
        input method
            add mozc
        global config
            trigger input method
      
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
            page zoom = 110%
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
