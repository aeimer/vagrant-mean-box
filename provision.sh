#!/bin/bash

echo
echo "## PROVISION SCRIPT ##"
echo

# add mongodb dependency
echo
echo "## Adding MongoDB Repo to apt-get"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# add chrome dependency
echo
echo "## Adding Chrome Repo to apt-get"
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# install with apt-get
echo
echo "## Updating dependency tree"
sudo apt-get -qq update
echo
echo "## Holding packages"
sudo apt-mark hold grub-pc grub-pc-bin grub2-common grub-common
echo
echo "## Upgrading programms"
sudo apt-get -y -qq upgrade
echo
echo "## Installing with APT-GET"
sudo apt-get -y -qq install \
git \
mongodb-org \
google-chrome-stable \
build-essential \
xvfb \
virtualbox-guest-dkms 
# XVFB: So we can run headless browser tests
# VB-guest-addtitions: I run the vbguest-additions-plugin for vagrant, so this call is not needed for me
echo
echo "## Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.bashrc
echo
echo "## Installing current NodeJS LTS"
nvm install --lts

# let mongodb start as a service
echo
echo "## Adding MongoDB as a Service, to start on vm-startup"
cat <<EOT | sudo tee /etc/systemd/system/mongodb.service > /dev/null
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --bind_ip 0.0.0.0 --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
EOT
sudo systemctl enable mongodb
sudo systemctl is-enabled mongodb
sudo systemctl start mongodb

# install global with npm
echo
echo "## Installing with NPM (GLOBAL)"
sudo npm install -g \
@angular/cli \
bower \
yo \
nodemon \
gulp \
node-gyp

# Set entry dir
cat <<EOT >> /home/vagrant/.bashrc

cd /vagrant
echo
echo "Hi there, have fun :)"
EOT

# Cleanup part
echo
echo "## Cleaning up system"
/vagrant/cleanup.sh

# Finished
echo
echo "## INFOS"
echo VERSION CONTROL:
echo -n GIT:
git --version
echo -n Chrome:
google-chrome-stable --version
echo -n BuildEssentials
apt-cache policy build-essential
echo -n NODE JS:
node -v
echo -n NPM:
npm -v
echo -n Angular-CLI:
ng --version
echo -n Bower:
bower --version
echo -n Yo:
yo --version
echo -n Nodemon:
nodemon --version
echo -n gulp:
gulp --version
echo -n node-gyp:
node-gyp --version
echo MONGODB:
mongod --version
sudo systemctl status mongodb

echo
echo "## FINISHED PROVISIONING"
