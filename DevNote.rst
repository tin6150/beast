
PAUP* is a tad annoying.  they are on this quasi commercial license, cuz trying to commercialize this?
It is not avail from any os package, nor saw source git repo.

But referred by Prof J Houselbenck, so not expecting this to be spyware.

So installing binary from http://phylosolutions.com/paup-test/

the binary may expire?  once version 5.0 is out?

~~~~~

docker build -t tin6150/paup40a168 -f Dockerfile .  | tee LOG.Dockerfile.txt
docker run -it --entrypoint=bash tin6150/paup40a168


docker pull ghcr.io/tin6150/phylotool:paup

 docker run -it --entrypoint=/bin/bash  ghcr.io/tin6150/phylotool:tool
