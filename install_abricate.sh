#!/bin/bash

## install mamba, abricate
## expect to be called by a container install script, eg Dockerfile


export TERM=dumb
export NO_COLOR=TRUE
export DEBIAN_FRONTEND=noninteractive

# conda update -n base -c defaults conda
# Or to minimize the number of packages updated during conda update use     
conda install conda=23.1.0

conda install -c conda-forge mamba
echo $?

mamba install -c bioconda abricate
echo $?

date
