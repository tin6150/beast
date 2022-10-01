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

echo "======================================================================"
echo "======================= installing beagle ====================="
echo "======================================================================"

git clone --depth=1 https://github.com/beagle-dev/beagle-lib.git
cd beagle-lib
mkdir build
cd build

mkdir -p /opt/libbeagle
#cmake -DCMAKE_INSTALL_PREFIX:PATH=$HOME ..
#cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/libbeagle ..
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/libbeagle -DBUILD_CUDA=ON -DBUILD_OPENCL=ON -DBUILD_JNI=ON ..
make install
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_CUDA=ON -DBUILD_OPENCL=ON -DBUILD_JNI=ON ..    # so that it also add the libs to /usr/lib
make install
echo $?

echo "======================================================================"
echo "==== running make test for beagle ====="
echo "======================================================================"
make test
echo $?

echo $?
date

echo "export LD_LIBRARY_PATH=/opt/libbeagle/lib:/lib64:$LD_LIBRARY_PATH"  	>  /etc/profile.d/libbeagle.sh
echo "export PKG_CONFIG_PATH=/opt/libbeagle/lib/pkgconfig:$PKG_CONFIG_PATH" >> /etc/profile.d/libbeagle.sh
