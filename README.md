# MEAN-BOX
_A Ubuntu:xenial64 based MEAN-Stack for development_

This is a MEAN (MongoDB Express Angular NodeJS) Stack.

## What's inside?
| Packagename      | Version | Info                                          |
|------------------|---------|-----------------------------------------------|
| Git              | 2.7.4   |                                               |
| Google Chrome    | 59      | real headless mode                            |
| NodeJS           | 8.0.0   |                                               |
| npm              | 5.0.0   | package-lock.json                             |
| Angular-CLI      | 1.0.0   |                                               |
| Bower            | 1.8.0   |                                               |
| Yo               | 1.8.5   |                                               |
| Nodemon          | 1.11.0  |                                               |
| gulp             | 3.9.1   |                                               |
| node-gyp         | 3.6.1   |                                               |
| MongoDB          | 3.4.3   |                                               |
| Build-Essentials | 12.1    | to compile for e.g. `npm install bcrypt lwip` |

## Why
This Box is used for the open-source project: https://github.com/h-da/geli

## Use
I recommend you to copy the [`Vagrantfile.example`](Vagrantfile.example) and extend it to your needs.   
The Vagrant Repo is here: https://atlas.hashicorp.com/aeimer/boxes/mean-box

## Build
You can use the Box from the Vagrant-Repo, but to build this box (e.g. if you customized the `provision.sh`) just run the `./build.sh`.
