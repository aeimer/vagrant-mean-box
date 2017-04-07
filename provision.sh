#/bin/bash

# add nodejs dependency
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# add mongodb dependency
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# install with apt-get
sudo apt-get update -qq
sudo apt-get install -y -qq \
git \
mongodb-org \
nodejs

# let mongodb start as a service
cat <<EOT | sudo tee /etc/systemd/system/mongodb.service
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
sudo npm install -g \
@angular/cli \
bower \
yo

# Finished
echo
echo VERSION CONTROL:
echo -n NODE JS:
node -v
echo -n NPM:
npm -v
echo MONGODB:
sudo systemctl status mongodb

