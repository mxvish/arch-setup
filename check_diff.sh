git clone https://github.com/mxvish/arch-setup.git
cd arch-setup

echo ''

diff -q .bashrc /home/$HOSTNAME/.bashrc

if [ $? -ne 0 ]; then
  echo "The files are different."
fi
