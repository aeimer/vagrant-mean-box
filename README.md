# MEAN-BOX
_A Ubuntu:xenial64 based MEAN-Stack for development_

This is a MEAN (MongoDB Express Angular NodeJS) Stack.

## What's inside?
- NodeJS
- Bower
- Angular-CLI
- Yo
- MongoDB

## Why
This Box may will be used for the open-source project: https://github.com/h-da/geli

## Use
I recommend you to copy the [`Vagrantfile.example`](Vagrantfile.example) and extend it to your needs.   
The Vagrant Repo is here: https://atlas.hashicorp.com/aeimer/boxes/mean-box

## Build
You can use the Box from the Vagrant-Repo, but to build this box (e.g. if you customized the `provision.sh`) just run the `./build.sh`.

_Note that you HAVE to set `config.ssh.username = "ubuntu'`. This is beacause we use the 'ubuntu/xenial64' box as base._

