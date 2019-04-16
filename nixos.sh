#!/bin/bash

lsblk
echo '!! BE CERTAIN OR YOU SHALL LOSE DATA !!'
echo 'Enter the /dev/device:'
read device

latest_iso_file="$(ls -t -1 nixos*.iso | head -1)"

echo "Flashing $device..."
time sudo dd bs=1M if="$latest_iso_file" of=$device status=progress
time sync
