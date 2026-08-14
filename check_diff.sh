echo ''

check_diff(){
  local filename="$1"
  local targetpath="$2$filename"

  diff -q $filename $targetpath 
}

check_diff ".bash_profile" "/home/$HOSTNAME/"
check_diff ".bashrc" "/home/$HOSTNAME/"
check_diff ".xinitrc" "/home/$HOSTNAME/" 

git clone https://github.com/mxvish/i3config
cd i3config
sh check_diff.sh

git clone https://github.com/mxvish/dotfiles
cd dotfiles
sh check_diff.sh 
