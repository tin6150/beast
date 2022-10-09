#!/bin/bash

## install beast
## expect to be called by a container install script, eg Dockerfile

## branch in v2 install beast version 2


export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive
export NO_COLOR=1 # https://no-color.org/

echo "===== installing dependencies ====="

apt-get update && apt-get -y --quiet install python2.7-dev


echo "============ installing paup* from their binary ======"

[[ -d /opt/paup ]] || mkdir /opt/paup
cd /opt/paup
wget --quiet http://phylosolutions.com/paup-test/paup4a168_ubuntu64.gz
echo $?
gunzip paup4a168_ubuntu64.gz
echo $?
ln -s  paup4a168_ubuntu64 paup

date
