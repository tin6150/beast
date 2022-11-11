
# started build like this, was for v1 
# the install_beast.sh really just do
# apt-get -y --quiet install beast-mcmc beast-mcmc-examples  beagle beagle-doc

bins:
/usr/bin/beast-mcmc
/usr/bin/beast-tracer
/usr/bin/beauti
/usr/bin/loganalyser
/usr/bin/logcombiner
/usr/bin/treeannotator
/usr/bin/treestat


jars:
/usr/share/beast-mcmc/beast.jar
/usr/share/beast-mcmc/beauti.jar
/usr/share/beast-mcmc/trace.jar

examples:
/usr/share/doc/beast-mcmc/examples/



beast run, but complain about beagle and gpu... 

> beast-mcmc
beignet-opencl-icd: no supported GPU found, this is probably the wrong opencl-icd package for this hardware
(If you have multiple ICDs installed and OpenCL works, you can ignore this message)
OpenCL error: CL_DEVICE_NOT_FOUND from file <GPUInterfaceOpenCL.cpp>, line 122.


 java -cp  /usr/share/beast-mcmc/beast.jar dr.app.beast.BeastMain -seed 2020 -beagle_double -beagle_gpu -save_every 1000000 -save_state travelHist.checkpoint  ../files/Protocol3/282_GISAID_sarscov2_travelHist_masked.xml


# none of them worked, think they are looking for gpu, and docker container tried didn't have one, 
# and didn't find way to just use cpu

# pausing this.  cpu just need jar which is in my epi_info dir... slurm_job.sh

# xref: sci-app.html


~~~~~

# manual container build:
docker build -t tin6150/beast -f Dockerfile .  | tee LOG.Dockerfile.txt
docker run -it --entrypoint=bash tin6150/beast

# github cloud action repo:
docker pull ghcr.io/tin6150/beast:r1
docker run -it  ghcr.io/tin6150/beast:r1        # get bash 


