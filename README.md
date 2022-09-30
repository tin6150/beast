# beast
containarization of the BEAST phylogenetic software

```

v2.6.4: contain beast 2.6.3,  build from source
r2.6.3: contain beast 2.6.3,  from Debian 11 bullseyes .deb package
v1:     contain beast 1.10.4, from Debian 11 bullseyes .deb package, untested

// release -> os provided package
// version -> compiled from source

v2 source: https://github.com/CompEvol/beast2/releases/tag/v2.6.4

DATA_DIR=/opt/gitrepo/beast2/examples

BEAST_DIR=/opt/gitrepo/container/
BEAST_DIR=/mnt/tin-gh/inet-dev-class/epi_info/DOWNLOADS
BEAST_DIR=/opt/gitrepo/beast2/release/Linux/jrebin
cd $BEAST_DIR
java -cp beast.jar dr.app.beast.BeastMain -seed 2020 -beagle_double -beagle_gpu -save_every 1000000 -save_state myBeast.checkpoint ${DATA_DIR}/testRelaxedClock.xml


"$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher $*

```
