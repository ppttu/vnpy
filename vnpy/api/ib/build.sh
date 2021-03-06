#!/bin/bash
# Written by Suzhengchun on 20160213

set -e
BUILDDIR=build
rm -rf $BUILDDIR
if [ ! -f $BUILDDIR ]; then
    mkdir -p $BUILDDIR
fi

pushd ibapi/linux
bash build.sh
popd

pushd $BUILDDIR
cmake ..
make VERBOSE=1 -j 1
cp ./lib/vnib.* ../
popd
