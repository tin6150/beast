

# is should be right for local build, 
# clould build branching??

# release -> os provided package
# version -> compiled from source

git checkout v2.6.4 # from source 
docker build -t tin6150/beast:v2.6.4 -f Dockerfile .  | tee LOG.Dockerfile.v264.txt
docker run -it --entrypoint=bash tin6150/beast:v2.6.4
docker run -v ~:/mnt -it --entrypoint=bash tin6150/beast:v2.6.4


~~~~~~

should be in installer script at ghcr b13
Singularity> cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/libbeagle -DBUILD_CUDA=ON -DBUILD_OPENCL=ON -DBUILD_JNI=ON ..
-- JAVA_HOME=
-- JNI_INCLUDE_DIRS=/usr/lib/jvm/java-11-openjdk-amd64/include;/usr/lib/jvm/java-11-openjdk-amd64/include/linux;/usr/lib/jvm/java-11-openjdk-amd64/include
-- JNI_LIBRARIES=/usr/lib/jvm/java-11-openjdk-amd64/lib/libjawt.so;/usr/lib/jvm/java-11-openjdk-amd64/lib/server/libjvm.so
-- Not using libtools for plugins
-- OpenCL Includes: /usr/local/cuda/include
-- OpenCL Libraries: /usr/local/cuda/lib64/libOpenCL.so
-- CUDA Includes: /usr/local/cuda/include
-- Configuring done
-- Generating done
-- Build files have been written to: /opt/gitrepo/beagle-lib/build


======================================================================
Moved from README
======================================================================

docker run -it --rm --gpus all  --entrypoint=/bin/bash  ghcr.io/tin6150/beast:v2.6.4
docker run -it --rm --gpus all  --entrypoint=/usr/bin/java   ghcr.io/tin6150/beast:v2.6.4  -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_info

for b15, with ubuntu 18.04 and cuda 11.2.1, error
beignet-opencl-icd: no supported GPU found, this is probably the wrong opencl-icd package for this hardware
(If you have multiple ICDs installed and OpenCL works, you can ignore this message)

OpenCL error: CL_DEVICE_NOT_FOUND from file <GPUInterfaceOpenCL.cpp>, line 118.

~~~~

docker troubleshooting

docker run -it --rm --gpus all -v ~:/mnt   ghcr.io/tin6150/beast:v2.6.4   -beagle_info
# b17@exa1>> Failed to load BEAGLE library: no hmsbeagle-jni in java.library.path
# but at least executing bin/beast

docker run -v ~:/mnt -it --gpus all --entrypoint=/bin/bash  ghcr.io/tin6150/beast:v2.6.4

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


~~~~


singularity env setup

[[ -d /global/scratch/users/${USER}/cacheDir ]] && export cacheDir=/global/scratch/users/${USER}/cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_CACHEDIR=$cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_TMPDIR=$cacheDir
[[ -d $cacheDir ]] && export SINGULARITY_WORKDIR=$cacheDir

~~~~~

Beast 2 from their github release
docker build, at least beagle and gpu are recognized:

cd $cacheDir
singularity pull --name beast2.6.4+beagle_b17.sif  docker://ghcr.io/tin6150/beast:v2.6.4


cd gs/tin-gh/beast2/examples/
singularity shell --nv $cacheDir/image/beast2.6.4+beagle_b15.sif     # **<<**
Singularity> /opt/gitrepo/beast/bin/beast -beagle_info
/opt/gitrepo/beast/bin/beast -beagle_info
singularity run --nv $cacheDir/image/beast2.6.4+beagle_b15.sif  /opt/gitrepo/beast/bin/beast -beagle_info
singularity run --nv $cacheDir/image/beast2.6.4+beagle_b15.sif /usr/bin/java -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_info
singularity run --nv $cacheDir/image/beast2.6.4+beagle_b15.sif /usr/bin/java -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_GPU testHKY.xml   # hung n0259.savio3 !
# CUDA error: "Unknown error" (222) from file </opt/gitrepo/beagle-lib/libhmsbeagle/GPU/GPUInterfaceCUDA.cpp>, line 284.
# host using CUDA 11.4

b17 need to use exec cuz changed to ENTRYPOINT and not accepting additional params
singularity exec --nv $cacheDir/image/beast2.6.4+beagle_b17.sif /usr/bin/java -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_info
>>failed>>
beignet-opencl-icd: no supported GPU found, this is probably the wrong opencl-icd package for this hardware
(If you have multiple ICDs installed and OpenCL works, you can ignore this message)

~~~~~

what the beast(2)/bin/beast script is essentially doing:

if [ -n "$BEAST_EXTRA_LIBS" ]; then
  "$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path=$BEAST_EXTRA_LIBS -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.app.beastapp.BeastLauncher $*
else
  "$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.app.beastapp.BeastLauncher $*
fi
# else clause is actually ran in my container:
# which is a command like:
./../jre1.8.0_282/bin/java -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_info
/usr/bin/java -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Duser.language=en -cp /opt/gitrepo/beast/lib/launcher.jar beast.app.beastapp.BeastLauncher -beagle_info


hopefully the bin/beast will work as entrypoint
and run java with detailed param if desire to change memory used by -Xms


other java troubleshooting notes:

# ref https://francoismichonneau.net/2014/05/how-to-install-beagle-on-ubuntu/
may need to change the beagle "bin" script, add -Djava.library.path=... ?
or try
export JAVA_HOME=/usr/bin



~~~~~

other way to run beast: 
./beast -beagle -beagle_SSE -threads 8 input.xml

cd ~/gs/tin-gh/beast2/examples
$cacheDir/image/beast2.6.4+beagle.sif  testClassicRootCalibrationPrior.xml
singularity shell $cacheDir/image/beast2.6.4+beagle.sif

cd ~/gs/tin-gh/beast2/examples
singularity build --sandbox beagle_c11 beast2.6.4+beagle.b.sif




~~~~~

b10 or so
older debug commands with beast 2 from github release (2.6.4)


cd $cacheDir
singularity pull --name beast2.6.4.sif  docker://ghcr.io/tin6150/beast:v2.6.4
./beast2.6.4.sif
Singularity> cd /opt/gitrepo/beast/examples 
Singularity> /opt/gitrepo/beast/bin/beast ./SnYFV.xml


cd gs/tin-gh/beast2/examples/
$cacheDir/image/beast2.6.4+beagle_b13.sif testHKY.xml


#xx DataDir=/opt/gitrepo/beast2/examples             # eg from git repo inside the container  (singularity would need a write overlay)


~~~~~

quite old troubleshooting notes


~~~~~

singularity sandbox for writable overlay

cd ~/gs/tin-gh/beast2/examples
singularity build --sandbox beagle_c11 beast2.6.4+beagle.b.sif


tbd with fri b12 image:
cd $cacheDir
mkdir $cacheDir/sandbox
cd $cacheDir/sandbox

# the b12 refers to ghcr job #12 (fri nite last build)
aptainer build --sanndbox beagle_b12  docker://ghcr.io/tin6150/beast:v2.6.4
sudo singularity build --sandbox

(singularity 3.8 or so didn't support the new aptainer build --sandbox
but think was able to do new sif :0



~~~~

#### local build beagle test:
Singularity> java -cp ${ContainerBeastJarDir}/beast.jar -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher \
${DataDir}/testRelaxedClock.xml
Error: Could not find or load main class beast.pkgmgmt.launcher.BeastLauncher
Caused by: java.lang.ClassNotFoundException: beast.pkgmgmt.launcher.BeastLauncher




~~~~~

maybe good sanity check for gpu access via container

docker run -it --rm --gpus all ubuntu nvidia-smi
