#!/bin/bash

## install beagle
## expect to be called by a container install script, eg Dockerfile



export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive


#apt-get -y --quiet install beagle beagle-doc 
# debiang baagle package is something else (phsing genotypes), not the gpu lib used by phylogeny tree sw.
# so for beast (and MrBayes), need to build from source., per URL
# beagle: https://github.com/beagle-dev/beagle-lib/wiki/LinuxInstallInstructions
# libs needed to build beagle:
apt-get -y --quiet install cmake build-essential autoconf automake libtool git pkg-config openjdk-11-jdk

#### install beagle ####

mkdir /opt/beagle-lib # destination dir

git clone --depth=1 https://github.com/beagle-dev/beagle-lib.git
cd beagle-lib
mkdir build
cd build
#cmake -DCMAKE_INSTALL_PREFIX:PATH=$HOME ..
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/beagle-dev ..
make install

echo $?
date

echo "export LD_LIBRARY_PATH=/opt/beagle-dev/lib:$LD_LIBRARY_PATH"  > /etc/profile.d/beagle-dev.sh
