#!/bin/bash
# 
# This script extracts all subtitles from the game data files.
#

# Errors are fatal
set -e

pushd $(dirname $0)/.. > /dev/null

cd files/ambient

echo "# "
echo "# Extracting ambient sound files in files/ambient/..."
echo "# "
python /mnt/external-tools/afu_to_wav.py *.rac

