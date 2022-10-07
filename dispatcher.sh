#!/bin/bash

# container entrypoint to invoke desired binary
# intended for use by singularity 
# that save image to file and name (or symlink) file with the desired app name
# see dispatcher.info.txt 

# FileName=$0
AdditionalArgs=$@
# echo "arg0 aka filename is : $FileName" 
# echo "dollar-at is : $AdditionalArgs" 
# 
# singularity onion cake has things in many layers
# no longer $0, but this should work.
FileName=$SINGULARITY_NAME

BaseFileName=$(basename $FileName)

case $BaseFileName in 
mb)
	/usr/bin/mb 	$AdditionalArgs ;;
beast2-mcmc)
	/usr/bin/beast2-mcmc 	$AdditionalArgs ;;
raxmlHPC)
	/usr/bin/raxmlHPC 	$AdditionalArgs ;;
mafft)
	/usr/bin/mafft 	$AdditionalArgs ;;
muscle)
	/usr/bin/muscle 	$AdditionalArgs ;;
tree-puzzle)
	/usr/bin/tree-puzzle 	$AdditionalArgs ;;
sumtrees)
	/usr/bin/sumtrees 	$AdditionalArgs ;;
clearcut)
	/usr/bin/clearcut 	$AdditionalArgs ;;
seaview)
	/usr/bin/seaview 	$AdditionalArgs ;;
phyml)
	/usr/bin/phyml 	$AdditionalArgs ;;
phast)
	/usr/bin/phast 	$AdditionalArgs ;;
njplot)
	/usr/bin/njplot 	$AdditionalArgs ;;
metaphlan2)
	/usr/bin/metaphlan2 	$AdditionalArgs ;;
examl)
	/usr/bin/examl 	$AdditionalArgs ;;
figtree)
	/usr/bin/figtree 	$AdditionalArgs ;;
*)
	#echo "unknown, dropping into the shell (inside singularity)";;
	/bin/bash ;;
esac


exit $?

