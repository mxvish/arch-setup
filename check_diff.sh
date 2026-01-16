echo ''

check_diff(){
  local filename="$1"
  local targetpath="$2$filename"

  diff -q $filename $targetpath 
  if [ $? -ne 0 ]; then
    echo "WARNING: The file $filename is different from $targetpath."
  fi
}

check_diff ".bash_profile" "/home/$HOSTNAME/"
check_diff ".bashrc" "/home/$HOSTNAME/"
check_diff ".xinitrc" "/home/$HOSTNAME/" 
