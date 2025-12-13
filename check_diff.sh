echo ''

diff -q .bashrc /home/$HOSTNAME/.bashrc

if [ $? -ne 0 ]; then
  echo "The files are different."
fi
