# MEAN-BOX
_A Ubuntu:xenial64 based MEAN-Stack for development_

This is a MEAN (MongoDB Express Angular NodeJS) Stack.

## What's inside?
| Packagename      | Version  | Info                                          |
|------------------|----------|-----------------------------------------------|
| Git              | 2.7.4    |                                               |
| Google Chrome    | 58       |                                               |
| NodeJS           | 7.10.0   |                                               |
| npm              | 4.2.0    |                                               |
| Angular-CLI      | 1.1.0    |                                               |
| Bower            | 1.8.0    |                                               |
| Yo               | 1.8.5    |                                               |
| Nodemon          | 1.11.0   |                                               |
| gulp             | 3.9.1    |                                               |
| node-gyp         | 3.6.2    |                                               |
| MongoDB          | 3.4.4    |                                               |
| Build-Essentials | 12.1     | to compile for e.g. `npm install bcrypt lwip` |
| Xvfb             | 2:1.18.4 | to run chrome "headless"                      |

## Why
This Box is used for the open-source project: https://github.com/h-da/geli

## Use
I recommend you to copy the [`Vagrantfile.example`](Vagrantfile.example) and extend it to your needs.   
The Vagrant Repo is here: https://atlas.hashicorp.com/aeimer/boxes/mean-box

You can activate NFS by (un)comment the mount lines, I hat some problems with that, so try it, but I have commented it out by default.

## Build
You can use the Box from the Vagrant-Repo, but to build this box (e.g. if you customized the `provision.sh`) just run the `./build.sh`.
