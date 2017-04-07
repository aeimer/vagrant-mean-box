#!/bin/bash

echo
echo "## PROVISION SCRIPT ##"
echo

# add nodejs dependency
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# add mongodb dependency
echo
echo "## Adding MongoDB Repo to apt-get"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# install with apt-get
echo "## Updating dependencies"
sudo apt-get update -qq
echo "## Installing with APT-GET"
sudo apt-get install -y -qq \
git \
mongodb-org \
nodejs

# let mongodb start as a service
echo
echo "## Adding MongoDB as a Service, to start on vm-startup"
cat <<EOT | sudo tee /etc/systemd/system/mongodb.service > /dev/null
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

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
nodemon

# Finished
echo
echo "## INFOS"
echo VERSION CONTROL:
echo -n NODE JS:
node -v
echo -n NPM:
npm -v
echo MONGODB:
sudo systemctl status mongodb

echo
echo "## FINISHED PROVISIONING"
