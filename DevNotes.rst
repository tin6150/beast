
# started build like this, was for v1 
# run, but complain about beagle and gpu... 
# moving dev to v2 for now
docker build -t tin6150/beast -f Dockerfile .  | tee LOG.Dockerfile.txt
docker run -it --entrypoint=bash tin6150/beast

