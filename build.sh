#!/bin/bash

vagrant box update \
&& vagrant up --provision \
&& vagrant package --output mean-box-$(date +%s).box \
&& vagrant destroy --force
