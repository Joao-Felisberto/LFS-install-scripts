#!/bin/bash

mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
	ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
	x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

groupadd lfs
# passwd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}

case $(uname -m) in
	x86_64) chown -v lfs $LFS/lib64 ;;
esac

# Prepare some stuff for part III
# cp -R build1 /home/lfs/
# cp build1.sh /home/lfs/

# todo: find a better way of doing this
cp prepCh4_lfs.sh /home/lfs/prepCh4_lfs.sh
echo "sh prepCh4_lfs.sh $LFS" > /home/lfs/.bashrc
chown lfs -R /home/lfs
su - lfs
