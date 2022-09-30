

# is should be right for local build, 
# clould build branching??

# release -> os provided package
# version -> compiled from source

git checkout v2.6.4 # from source 
docker build -t tin6150/beast:v2.6.4 -f Dockerfile .  | tee LOG.Dockerfile.v264.txt
docker run -it --entrypoint=bash tin6150/beast:v2.6.4


