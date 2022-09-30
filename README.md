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

singularity shell docker://ghcr.io/tin6150/beast:v1
```


