

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

