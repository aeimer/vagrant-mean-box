#!/bin/bash

vagrant up --provision \
&& vagrant package --output mean-box.box \
&& vagrant destroy --force
