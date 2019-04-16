#!/bin/bash

lsblk
echo '!! BE CERTAIN OR YOU SHALL LOSE DATA !!'
echo 'Enter the /dev/device:'
read device

wget \
	--no-clobber \
	--content-disposition \
	--recursive \
	--no-parent \
	--no-directories \
	--level=1 \
	--accept iso,iso.sig \
	http://mirror.dal10.us.leaseweb.net/archlinux/iso/latest/
latest_arch="$(ls -t -1 *archlinux*.iso | head -1)"
gpg --keyserver-options auto-key-retrieve --verify "$latest_arch.sig"

sudo umount ${device}*

echo "Flashing $device..."
time sudo dd bs=4M if="$latest_arch" of=$device status=progress oflag=sync
time sync
