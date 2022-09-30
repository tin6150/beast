#!/bin/bash

## install beast
## expect to be called by a container install script, eg Dockerfile

## branch in v2 install beast version 2


export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive

# ubuntu focal package name
# beast2-mcmc/stable 2.6.3+dfsg-2 all
apt-get -y --quiet install beast2-mcmc beast2-mcmc-examples beast2-mcmc-doc beagle beagle-doc 
echo $?
apt-get -y --quiet install figtree bali-phy
echo $?

date
