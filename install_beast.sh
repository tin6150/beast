#!/bin/bash

## install beast
## expect to be called by a container install script, eg Dockerfile

export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive

# ubuntu focal package name
apt-get -y --quiet install beast-mcmc beast-mcmc-examples 
apt-get -y --quiet install figtree bali-phy
