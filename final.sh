systemctl enable bluetooth.service 
systemctl start bluetooth.service 

乃木坂46 (Nogizaka46) - 口約束 乃木坂46 (Nogizaka46) - 口約束 乃木坂46 (Nogizaka46) - 口約束 git clone https://github.com/mxvish/i3config.git
cd i3config
mv config ~/.config/i3/
chown $USER:$USER /home/$USER/.config/i3/config
sudo mv i3status.conf /etc/

wget -q https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc
mv vimrc /home/$USER/.vimrc
chown $USER:$USER /home/$USER/.vimrc

pactl set-source-mute @DEFAULT_SOURCE@ toggle

sed -i  's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

sed -i 's/Monospace 10/Monospace 12/' .config/lxterminal/lxterminal.conf
sed -i 's/hidemenubar=false/hidemenubar=true/' .config/lxterminal/lxterminal.conf
sed -i 's/hidescrollbar=false/hidescrollbar=true/' .config/lxterminal/lxterminal.conf

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
firefox
    fonts -> fonts for latin
        serif      : FreeSerif
        sans-serif : FreeSans
'
