SDDEV=/dev/sdb
PARTS=$SDDEV?
for f in $PARTS; do umount $f; done
dd bs=4M if=tmp/deploy/images/raspberrypi3/core-image-base-raspberrypi3.rpi-sdimg of=/dev/sdb conv=fsync
while [ ! -e ${SDDEV}1 ]; do
    sleep 1
done
mkdir _boot
mount ${SDDEV}1 _boot
mkdir _rootfs
mount ${SDDEV}2 _rootfs
cp -vR device-config/rootfs/* _rootfs/
cp -vR device-config/boot/* _boot/
for f in $PARTS; do umount $f; done
rm -R _boot _rootfs
