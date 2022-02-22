#!/bin/bash

[ -d $LFS/sources ] && exit

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

# TODO: make this link customizable or even better provide the sources on the ISO
wget "https://ftp.wrz.de/pub/LFS/lfs-packages/11.0/wget-list"
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

# TODO: break program if some check fails
pushd $LFS/sources
	wget "https://ftp.wrz.de/pub/LFS/lfs-packages/11.0/md5sums"
	md5sum -c md5sums
popd
