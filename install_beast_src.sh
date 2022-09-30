#!/bin/bash

## install beast
## expect to be called by a container install script, eg Dockerfile

## branch in v2 install beast version 2
## https://github.com/CompEvol/beast2/


export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive

# ubuntu focal package name
# beast2-mcmc/stable 2.6.3+dfsg-2 all
#apt-get -y --quiet install beast2-mcmc beast2-mcmc-examples beast2-mcmc-doc beagle beagle-doc 
apt-get -y --quiet install beagle beagle-doc 
echo $?
apt-get -y --quiet install figtree bali-phy
echo $?
apt-get -y --quiet install mrbayes mybayes-doc mybayes-mpi
echo $?


# https://github.com/CompEvol/beast2/archive/refs/heads/master.zip
# git clone https://github.com/CompEvol/beast2.git


wget --quiet https://github.com/CompEvol/beast2/releases/download/v2.6.4/BEAST_with_JRE.v2.6.4.Linux.tgz
tar xfz BEAST_with_JRE.v2.6.4.Linux.tgz
# tar file already contain
#  beast/lib/beast.jar
#  beast/lib/launcher.jar

# so no need to download these other pieces separately
# left for now for debug use
mkdir Beast_Jar
cd    Beast_Jar
wget --quiet https://github.com/CompEvol/beast2/releases/download/v2.6.4/beast.jar
wget --quiet https://github.com/CompEvol/beast2/releases/download/v2.6.4/launcher.jar

date
