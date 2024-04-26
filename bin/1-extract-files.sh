#!/bin/bash
# 
# This script extracts all soundfiles from the TNG ZIP file.
#

# Errors are fatal
set -e

pushd $(dirname $0)/.. > /dev/null

FILE="STTNG.ZIP"

echo "# "
echo "# Extracting Ambient Audio files (*.rac)..."
echo "# "
unzip -n ${FILE} *.rac -d files/ambient

echo "# "
echo "# Extracting Sound Effect files (*.mac)..."
echo "# "
unzip -n ${FILE} *.mac -d files/sfx

echo "# "
echo "# Extracting Voice  Audio files (*.vac) and subtitle (*.bst) files..."
echo "# "
unzip -n ${FILE} *.vac *.bst -d files/voice

echo "# All done!  Files are in the files/ directory."

