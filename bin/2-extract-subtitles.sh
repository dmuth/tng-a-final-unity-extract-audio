#!/bin/bash
# 
# This script extracts all subtitles from the game data files.
#

# Errors are fatal
set -e

pushd $(dirname $0)/.. > /dev/null

cd files/voice

echo "# "
echo "# Extracting subtitles..."
echo "# "
python /mnt/external-tools/afu_subtitles.py .

echo "# "
echo "# Done!  Subtitles are now in subtitles.json: "
echo "# "
ls -l subtitles.json

