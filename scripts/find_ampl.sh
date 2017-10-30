#! /bin/bash

cd /opt

# Extract the demo version archive, if it exists
if [ -f ampl.linux64.tgz ]; then
    tar xvf ampl.linux64.tgz
    rm ampl.linux64.tgz 
fi

AMPL_BIN=$(find . -name ampl -type f -executable -prune -print0)
if [ -f "$AMPL_BIN" ]; then
    AMPL_DIR=$(dirname $AMPL_BIN)
    echo "Found ampl binary in $AMPL_DIR, $($AMPL_BIN --version)"
    if [ "$AMPL_DIR" != "./ampl" ]; then
        ln -s "$AMPL_DIR" ampl
        echo "Added symlink $(ls -l ampl)"
    fi
else
    echo "No AMPL binary found in $(pwd)"
    exit 1
fi

