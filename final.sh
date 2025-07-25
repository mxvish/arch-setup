mv config  /home/$USER/.config/i3/
chown $USER:$USER /home/$USER/.config/i3/config

wget -q https://raw.githubusercontent.com/mxvish/i3status/main/i3status.conf
mv i3status.conf /etc/

wget -q https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc
mv vimrc /home/$USER/.vimrc
chown $USER:$USER /home/$USER/.vimrc

pacman -Syu --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay-bin.git
sudo chown $(whoami):$(whoami) yay-bin
cd yay-bin
makepkg -si --noconfirm
yay -S --noconfirm brave-bin

#wget https://raw.githubusercontent.com/mxvish/GUI-timer/main/cd.java

pactl set-source-mute @DEFAULT_SOURCE@ toggle

sed -i  's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

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
