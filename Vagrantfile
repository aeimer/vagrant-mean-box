# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box =           "bento/ubuntu-16.04"
  config.ssh.insert_key =   false
  config.vm.synced_folder   ".", "/vagrant"
  config.vm.provision       "shell", path: "provision.sh"
end

