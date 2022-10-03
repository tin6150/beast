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
