#!/usr/bin/env bash

set -e

# change these!
GO_PROJECT=github.com/AstromechZA/spiro
BINARY_NAME=spiro
VERSION_NUM=$(cat VERSION)

function buildbinary {
    goos=$1
    goarch=$2

    echo "Building official $goos $goarch binary"

    outputfolder="build/${goos}_${goarch}"
    echo "Output Folder: $outputfolder"
    mkdir -pv $outputfolder

    export GOOS=$goos
    export GOARCH=$goarch

    govvv build -i -v -o "$outputfolder/$BINARY_NAME" $GO_PROJECT

    ls -lh "$outputfolder/$BINARY_NAME"
    file "$outputfolder/$BINARY_NAME"
    echo
}

# build local 
unset GOOS
unset GOARCH
govvv build $GO_PROJECT

# do some tests
rm -rfv demo/output/*
./spiro demo/example1 demo/example1.yml demo/output 
rm -rfv demo/output/*
./spiro demo/example2 demo/example2.yaml demo/output 

# build for mac
buildbinary darwin amd64

# build for linux
buildbinary linux amd64

# zip up
tar -czf $BINARY_NAME-${VERSION_NUM}.tgz -C build .
ls -lh $BINARY_NAME-${VERSION_NUM}.tgz
file $BINARY_NAME-${VERSION_NUM}.tgz