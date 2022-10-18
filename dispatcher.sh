#!/bin/bash

# container entrypoint to invoke desired binary
# intended for use by singularity 
# that save image to file and name (or symlink) file with the desired app name
# see dispatcher.info.txt 

FileName=$0
AdditionalArgs=$@
# echo "arg0 aka filename is : $FileName" 
# echo "dollar-at is : $AdditionalArgs" 
# 
# singularity onion cake has things in many layers
# no longer $0, but this works when in a singularity container.
[[ x$SINGULARITY_NAME != x ]] && FileName=$SINGULARITY_NAME

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
clustalw)
	/usr/bin/clustalw 	$AdditionalArgs ;;
clustalo)
	/usr/bin/clustalo 	$AdditionalArgs ;;
clustalx)
	/usr/bin/clustalx 	$AdditionalArgs ;;
prokka)
	/usr/bin/prokka 	$AdditionalArgs ;;
roary)
	/usr/bin/roary 	$AdditionalArgs ;;
snp-sites)
	/usr/bin/snp-sites 	$AdditionalArgs ;;
run-gubbins)
	/usr/bin/run-gubbins 	$AdditionalArgs ;;
iqtree)
	/usr/bin/iqtree 	$AdditionalArgs ;;
art)
	/usr/bin/art 	$AdditionalArgs ;;
#  this next one maybe a bad idea... but hoping to be able to generically allow `phylotool.sif clustalw arg1`  or the like
#  `phylotool sudo RM ...` with ... being something else maybe disastrous ... in docker.   (?)
phylotool.sif)
	$AdditionalArgs ;;
*)
	#echo "unknown, dropping into the shell (inside singularity)";;
	/bin/bash ;;
esac


exit $?

