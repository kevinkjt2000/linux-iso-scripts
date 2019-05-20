#!/bin/bash

lsblk
echo '!! BE CERTAIN OR YOU SHALL LOSE DATA !!'
echo 'Enter the /dev/device:'
read device

sudo umount ${device}*
echo "Flashing $device..."
time sudo dd bs=4M if=ubuntu-19.04-desktop-amd64.iso of=${device} conv=fdatasync
time sync
