echo ''

check_diff(){
  local filename="$1"
  local targetpath="$2"

  diff -q $filename $targetpath 
  if [ $? -ne 0 ]; then
    echo "WARNING: The file $filename is different from $targetpath."
  fi
}

check_diff ".bashrc" "/home/$HOSTNAME/$filename"
