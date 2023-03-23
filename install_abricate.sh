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

#xx mamba install -c bioconda abricate  # fails to find perl 5.22, while container has perl 5.31.1

# using instruction from abricate https://github.com/tseemann/abricate
conda install -c conda-forge -c bioconda -c defaults abricate
echo $?

which abricate
# expect /opt/conda/bin/abricate
abricate --check
abricate --list

# def has ecoli_vf resfinder resfinder
# so enough DB for now

date
