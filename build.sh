#!/bin/bash
WORKDIR="$PWD/bin"
mkdir -pv $WORKDIR
VER=$(grep "ENV VER" Dockerfile | grep -v '^[[:space:]]*#' | cut -d" " -f3)
#docker build --no-cache -t screen-static-coreos:latest .
docker build -t hpsahba-static-coreos:latest .
docker run -v $WORKDIR:/mnt hpsahba-static-coreos:latest cp -v /home/core/hpsahba-$VER/hpsahba /mnt
docker run -v $WORKDIR:/mnt hpsahba-static-coreos:latest cp -v /home/core/hpsahba-$VER/hpsahba-upx /mnt
mv $WORKDIR/hpsahba $WORKDIR/hpsahba-non-upx
mv $WORKDIR/hpsahba-upx $WORKDIR/hpsahba

cd $WORKDIR
#md5sum -b screen-non-upx > screen-non-upx.md5
#sha1sum -b screen-non-upx > screen-non-upx.sha1
#sha256sum -b screen-non-upx > screen-non-upx.sha256
#sha512sum -b screen-non-upx > screen-non-upx.sha512
#md5sum -b screen > screen.md5
#sha1sum -b screen > screen.sha1
#sha256sum -b screen > screen.sha256
#sha512sum -b screen > screen.sha512

