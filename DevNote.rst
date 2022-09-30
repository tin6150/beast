

# is should be right for local build, 
# clould build branching??

# release -> os provided package
# version -> compiled from source

git checkout r2.6.3 # ie package provided by Debian 11 bullseye
docker build -t tin6150/beast:v2 -f Dockerfile .  | tee LOG.Dockerfile.v2.txt
docker run -it --entrypoint=bash tin6150/beast:v2


