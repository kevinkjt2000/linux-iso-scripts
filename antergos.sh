#!/bin/bash

lsblk
echo '!! BE CERTAIN OR YOU SHALL LOSE DATA !!'
echo 'Enter the /dev/device:'
read device

wget --no-clobber --content-disposition https://antergos.com/download/antergos-live-iso/
latest_antergos="$(ls -t -1 *antergos*.iso | head -1)"

echo "Flashing $device..."
time sudo dd bs=4M if="$latest_antergos" of=$device status=progress
time sync
