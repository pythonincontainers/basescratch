#! /bin/sh

apt update
apt install -y debootstrap
export MY_ROOT=/data/root
mkdir -p $MY_ROOT
debootstrap --variant=minbase bionic $MY_ROOT http://archive.ubuntu.com/ubuntu/
mount --bind /dev $MY_ROOT/dev
mount --bind /dev/pts $MY_ROOT/dev/pts
mount --bind /sys $MY_ROOT/sys
mount --bind /proc $MY_ROOT/proc
cp /etc/hosts $MY_ROOT/etc/hosts
cp /proc/mounts $MY_ROOT/etc/mtab
cp /etc/resolv.conf $MY_ROOT/etc/resolv.conf
cp /host/install-python3.7.sh $MY_ROOT/tmp
cp /host/packages_to_purge.txt $MY_ROOT/tmp
chroot $MY_ROOT /bin/sh /tmp/install-python3.7.sh
mkdir -p /host/build
cp $MY_ROOT/rootfs.tar.gz /host/build
