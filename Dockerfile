# Dockerfile for creating container to conda, mamba, Abricate
# manual build, mostly:
# docker build -f Dockerfile .  | tee LOG.Dockerfile.txt
# see DevNotes.rst for more build details


#FROM debian:bullseye
#FROM continuumio:miniconda3
#FROM continuumio/miniconda3:latest
FROM continuumio/miniconda3:22.11.1

MAINTAINER Tin (at) berkeley.edu
ARG DEBIAN_FRONTEND=noninteractive
#ARG TERM=vt100
ARG TERM=dumb
ARG TZ=PST8PDT
#https://no-color.org/
ARG NO_COLOR=1

LABEL Ref=https://github.com/tseemann/abricate
LABEL Ref=https://github.com/tin6150/phylotool



# will use stand alone script to do most of the installation
# so that it can be used on singlarity (if not building from docker image)
# or perhaps installed on a cloud instance directly

RUN echo  ''  ;\
    touch _TOP_DIR_OF_CONTAINER_  ;\
    echo "This container build as os, then add additional package via standalone shell script " | tee -a _TOP_DIR_OF_CONTAINER_  ;\
    export TERM=dumb      ;\
    export NO_COLOR=TRUE  ;\
    apt-get update ;\
    apt-get -y --quiet install git git-all file wget curl gzip bash zsh fish tcsh less vim procps screen tmux ;\
    apt-get -y --quiet install apt-file ;\
    cd /    ;\
    echo ""

RUN echo ''  ;\
    echo '==================================================================' ;\
    test -d /opt/gitrepo            || mkdir -p /opt/gitrepo             ;\
    test -d /opt/gitrepo/container  || mkdir -p /opt/gitrepo/container   ;\
    #the git command dont produce output, thought container run on the dir squatting on the git files.  COPY works... oh well
    #git branch |tee /opt/gitrepo/container/git.branch.out.txt            ;\
    #git log --oneline --graph --decorate | tee /opt/gitrepo/container/git.lol.out.txt       ;\
    #--echo "--------" | tee -a _TOP_DIR_OF_CONTAINER_           ;\
    #--echo "git cloning the repo for reference/tracking" | tee -a _TOP_DIR_OF_CONTAINER_ ;\
    cd /     ;\
    echo ""

# add some marker of how Docker was build.
COPY .              /opt/gitrepo/container/
#COPY Dockerfile*   /opt/gitrepo/container/


RUN echo  ''  ;\
    touch _TOP_DIR_OF_CONTAINER_  ;\
    echo "begining docker build process at " | tee -a _TOP_DIR_OF_CONTAINER_  ;\
    date | tee -a       _TOP_DIR_OF_CONTAINER_ ;\
    export TERM=dumb      ;\
    export NO_COLOR=TRUE  ;\
    cd /     ;\
    echo ""  ;\
    echo '==================================================================' ;\
    echo " calling external shell script..." | tee -a _TOP_DIR_OF_CONTAINER_  ;\
    echo " cd to /opt/gitrepo/container/"    | tee -a _TOP_DIR_OF_CONTAINER_  ;\
    date | tee -a      _TOP_DIR_OF_CONTAINER_                                 ;\
    echo '==================================================================' ;\
    cd /opt/gitrepo/container     ;\
    bash -x install_abricate.sh 2>&1 | tee install_abricate.log                     ;\
    cd /    ;\
    echo ""


ENV DBG_CONTAINER_VER  "Dockerfile 2023.0322"
ENV DBG_DOCKERFILE Dockerfile

RUN  cd / \
  && touch _TOP_DIR_OF_CONTAINER_  \
  && echo  "--------" >> _TOP_DIR_OF_CONTAINER_   \
  && TZ=PST8PDT date  >> _TOP_DIR_OF_CONTAINER_   \
  && echo  $DBG_CONTAINER_VER   >> _TOP_DIR_OF_CONTAINER_   \
  && echo  "Grand Finale for Dockerfile"


ENV TZ America/Los_Angeles
# ENV TZ likely changed/overwritten by container's /etc/csh.cshrc
# ENV does overwrite parent def of ENV, so can rewrite them as fit.
ENV TEST_DOCKER_ENV     this_env_will_be_avail_when_container_is_run_or_exec
ENV TEST_DOCKER_ENV_2   Can_use_ADD_to_make_ENV_avail_in_build_process
ENV TEST_DOCKER_ENV_REF https://vsupalov.com/docker-arg-env-variable-guide/#setting-env-values

ENV TEST_DOCKER_ENV_YEQ1="Dockerfile ENV assignment as foo=bar, yes use of ="
ENV TEST_DOCKER_ENV_NEQ1 "Dockerfile ENV assignment as foo bar, no  use of =, both seems to work"


# unsure how to append/add to PATH?  likely have to manually rewrite the whole ENV var
#ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/conda/bin
# above is PATH in :integrationU where R 4.1.1 on Debian 11  works on Ubuntu 16.04 path
# below PATH doesn't help resolve Rscript /main.R not finding R problem, but it should not hurt.
#-- ENV PATH=/usr/lib/R/bin/exec:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#-- unset path to ensure it didn't make Rscript behave worse cuz somehow "test" got masked/lost



ENTRYPOINT [ "/bin/bash" ]
#ENTRYPOINT [ "Rscript", "/opt/gitrepo/atlas/main.R" ]
#ENTRYPOINT [ "Rscript", "/main.R" ]

# vim: shiftwidth=4 tabstop=4 formatoptions-=cro nolist nu syntax=on
