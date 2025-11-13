git clone https://github.com/mxvish/arch-setup.git
cd arch-setup

echo ''

diff -q bashrc /home/$HOSTNAME/.bashrc

if [ $? -eq 0 ]; then
  echo "The files are identical."
else
  echo "The files are different."
fi
