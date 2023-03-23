#!/bin/bash

## install mamba, abricate
## expect to be called by a container install script, eg Dockerfile


export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive

conda install -c conda-forge mamba
echo $?

mamba install abricate
echo $?

date
