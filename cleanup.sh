#!/bin/bash

# from https://gist.github.com/adrienbrault/3775253

echo
echo "## removes unneccesary packages"
# Remove unneccesary packages
sudo aptitude -y purge \
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
libffi5 \
linux-image-3.0.0-12-generic-pae

# Remove APT cache
echo
echo "## Clean apt repo cache"
sudo apt-get clean -y
sudo apt-get autoclean -y

# Zero free space to aid VM compression
echo
echo "## Zero free space"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Remove bash history
echo
echo "## Remove bash-history"
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

# Cleanup log files
echo
echo "## Remove logfiles"
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# Whiteout root
echo
echo "## Whiteout root"
count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`; 
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
rm /tmp/whitespace;
 
# Whiteout /boot
echo
echo "## Whiteout /boot"
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
rm /boot/whitespace;
 
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart;
swapon $swappart;
