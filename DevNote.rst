


# is should be right for local build, 
# clould build branching??

git checkout v2
docker build -t tin6150/beast:v2 -f Dockerfile .  | tee LOG.Dockerfile.v2.txt
docker run -it --entrypoint=bash tin6150/beast


