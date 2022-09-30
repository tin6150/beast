# beast
containarization of the BEAST phylogenetic software

```
v2.6.4: contain beast 2.6.3,  build from source
r2.6.3: contain beast 2.6.3,  from Debian 11 bullseyes .deb package
v1:     contain beast 1.10.4, from Debian 11 bullseyes .deb package, untested

// release -> os provided package
// version -> compiled from source

```

savio hpc user run as:

```{bash}

# xx module load container/singularity

[[ -d /global/scratch/users/${USER}/cacheDir ]] && export cacheDir=/global/scratch/users/${USER}/cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_CACHEDIR=$cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_TMPDIR=$cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_WORKDIR=$cacheDir

singularity shell docker://ghcr.io/tin6150/beast:v2.6.4


Singularity> java -cp ${ContainerBeastJarDir}/beast.jar -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher \
${DataDir}/testRelaxedClock.xml
Error: Could not find or load main class beast.pkgmgmt.launcher.BeastLauncher
Caused by: java.lang.ClassNotFoundException: beast.pkgmgmt.launcher.BeastLauncher


```

Docker usage (debug use):

```
docker run -v ~:/mnt -it --entrypoint=/bin/bash  ghcr.io/tin6150/beast:v2.6.4  

ContainerBeastJarDir=/opt/gitrepo/Beast_Jar/
BEAST_LIB=/opt/gitrepo/Beast_Jar/
DataDir=~/myDataDir   # local host home dir
DataDir=/opt/gitrepo/beast2/examples             # eg from git repo inside the container



docker run -v ~:/mnt -it --entrypoint=/usr/bin/java  ghcr.io/tin6150/beast:v2.6.4  \
-cp ${ContainerBeastJarDir}/beast.jar -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher \
${DataDir}/testRelaxedClock.xml
## $*


-cp ${ContainerBeastJarDir}/beast.jar dr.app.beast.BeastMain -seed 2020 -beagle_double -beagle_gpu -save_every 1000000 -save_state myBeast.checkpoint 

"$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher $*


#xx docker run -v ~:/mnt -it --entrypoint=/bin/java  ghcr.io/tin6150/beast:v2.6.4  -cp /opt/gitrepo/Beast_Jar/beast.jar dr.app.beast.BeastMain -seed 2020 -beagle_double -beagle_gpu -save_every 1000000 -save_state myBeast.checkpoint ${DATA_DIR}/testRelaxedClock.xml

v2 source: https://github.com/CompEvol/beast2/releases/tag/v2.6.4


# xxx >>>

BEAST_DIR=/opt/gitrepo/container/
BEAST_DIR=/mnt/tin-gh/inet-dev-class/epi_info/DOWNLOADS
BEAST_DIR=/opt/gitrepo/beast2/release/Linux/jrebin
cd $BEAST_DIR
java -cp beast.jar dr.app.beast.BeastMain -seed 2020 -beagle_double -beagle_gpu -save_every 1000000 -save_state myBeast.checkpoint ${DATA_DIR}/testRelaxedClock.xml


"$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher $*

```


best1 example command

```
docker run -v ~:/mnt -it --entrypoint=/usr/bin/java  ghcr.io/tin6150/beast:v1 -cp ${ContainerBeastJarDir}/beast.jar dr.app.beast.BeastMain -seed 2020 -beagle_double -beagle_gpu -save_every 1000000 -save_state myBeast.checkpoint ${DataDir}/beast1_travel.xml
```
