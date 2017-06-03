#!/bin/bash

# from https://gist.github.com/adrienbrault/3775253

echo
echo "## removes unneccesary packages"
# Remove unneccesary packages
sudo apt-get -y purge \
ri  \
installation-report \
landscape-common \
wireless-tools \
wpasupplicant \
ubuntu-serverguide \
python-dbus \
libnl1 \
python-smartpm \
python-twisted-core \
libiw30 \
python-twisted-bin \
libdbus-glib-1-2 \
python-pexpect \
python-pycurl \
python-serial \
python-gobject \
python-pam \
python-openssl \
libffi5

# Remove APT cache
echo
echo "## Clean apt repo cache"
sudo apt-get clean -y
sudo apt-get autoclean -y

# Zero free space to aid VM compression
echo
echo "## Zero free space"
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

# Remove bash history
echo
echo "## Remove bash-history"
unset HISTFILE
sudo rm -f /root/.bash_history
sudo rm -f /home/vagrant/.bash_history

# Cleanup log files
echo
echo "## Remove logfiles"
sudo find /var/log -type f | while read f; do sudo echo -ne '' > $f; done;

# Whiteout root
echo
echo "## Whiteout root"
count=`sudo df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`; 
let count--
sudo dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
sudo rm /tmp/whitespace;
 
# Whiteout /boot
echo
echo "## Whiteout /boot"
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
sudo dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
sudo rm /boot/whitespace;
 
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
sudo swapoff $swappart;
sudo dd if=/dev/zero of=$swappart;
sudo mkswap $swappart;
sudo swapon $swappart;
