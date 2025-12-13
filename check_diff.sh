echo ''

check_diff(){
  local filename="$1"
  diff -q $filename  /home/$HOSTNAME/$filename

  if [ $? -ne 0 ]; then
    echo "WARNING: The file $filename is different from $HOME/$filename."
  fi
}

files=(
  ".bashrc"
)

for i in "${files}";
  do check_diff $i;
done
