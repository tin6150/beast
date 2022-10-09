see dispatcher.info.txt on info how to setup sym link to an singularity image
so that the desired phylogenetic program get executed

~~~~

branch:
tool:   contain mrbayes, mafft, muscle and many phylo tool avail from apt install.

[[ -d /global/scratch/users/${USER}/cacheDir ]] && export cacheDir=/global/scratch/users/${USER}/cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_CACHEDIR=$cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_TMPDIR=$cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_WORKDIR=$cacheDir

cd $cacheDir
singularity pull --name phylotool.sif  docker://ghcr.io/tin6150/beast:tool



singularity run --nv $cacheDir/image/beast2.6.4+beagle_b20.sif -beagle_GPU testHKY.xml
singularity run --nv $cacheDir/image/phylotool.sif  # entrypoint=/usr/bin/mb # MrBayes

cd ~/gs/tin-gh/beast2/examples/
singularity exec --nv $cacheDir/image/phylotool.sif /usr/bin/java -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_GPU testHKY.xml # 

~~~~

docker pull ghcr.io/tin6150/beast:tool
docker save ghcr.io/tin6150/beast -o phytool.dimg
docker run -v ~:/mnt -it --gpus all --entrypoint=/bin/bash ghcr.io/tin6150/beast:tool

docker run -v ~:/mnt -it  ghcr.io/tin6150/beast:tool
#  actually can't test dispatcher with docker... 

# attempt to save the docker image to run on machines without direct internet connection...
# didn't quite work, missing something, need to lookup how the registry server was configured, TBD...

docker save ghcr.io/tin6150/beast -o phytool.tar
docker import  phytool_incomplete2.tar
docker image ls
docker tag 3abd87b19d83 phytool_incomplete2
docker run -v ~:/mnt -it --gpus all --entrypoint=/bin/bash phytool_incomplete2
nope, something wrong.  dig import from registry

