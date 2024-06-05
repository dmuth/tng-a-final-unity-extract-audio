#!/bin/bash
# 
# This script extracts all subtitles from the game data files.
#

# Errors are fatal
set -e

pushd $(dirname $0)/.. > /dev/null

function convert_ambient() {

    pushd files/ambient > /dev/null

    echo "# "
    echo "# Extracting ambient sound files in files/ambient/..."
    echo "# "
    python /mnt/external-tools/afu_to_wav.py *.rac

    popd > /dev/null

} # End of convert_ambient()


function convert_voice() {

    pushd files/voice > /dev/null

    echo "# "
    echo "# Extracting voice sound files in files/voice/..."
    echo "# "
    python /mnt/external-tools/afu_to_wav.py *.vac

    popd > /dev/null


} # End of convert_voice()


convert_ambient
convert_voice


