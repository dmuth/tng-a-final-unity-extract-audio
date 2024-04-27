#!/bin/bash
#
# Main entrypoint for our Docker container.
#

# Errors are fatal
set -e

# 
# Make sure we're not inside of Docker
#
if test "${DOCKER}"
then
    echo "! "
    echo "! Don't run this inside of the Docker container!"
    echo "! "
    exit 1
fi

# Set this so we can't run this script again. :-)
export DOCKER=true

# Let's go to our host directory, where all the files are.
cd /mnt

echo "# "
echo "# Welcome to the Star Trek: TNG: A Final Unity Utilities Docker Container!"
echo "# "

FILE="STTNG.ZIP"

echo -n "# Checking to see if file ${FILE} exists..."
if test ! -f "${FILE}"
then
    echo
    echo "! "
    echo "! Could not file '${FILE}'.  Please grab it from the game and place it"
    echo "! in the host directory before continuing."
    echo "! "
    exit 1
fi

echo "Found!"

echo "# "
echo "# The host filesystem is in: /mnt"
echo "# Utilities are in: /mnt/bin/ and /mnt/external-tools/"
echo "# "
echo "# These are the scripts you'll want to run to extract the sound files:"
echo "# "
echo "# /mnt/bin/1-extract-files.sh - Extract the RAC, MAC, and VAC files from the STTNG.ZIP file."
echo "# /mnt/bin/2-extract-subtitles.sh - Extract the subtitles to a JSON file"
echo "# /mnt/bin/3-extract-wav-files.sh - Extract the actual WAV files"
echo "# "
echo "# Files will be written to /mnt/files/, which is really files/ in the host filesystem."
echo "# "

#
# Check to see if we are in test mode.  This is so we can test our entrypoint logic
# without sitting in a bash shell afterwards.
#
if test "$1" == "test"
then
    echo "! "
    echo "! Oh--I see we are in test mode!  Exiting now..."
    echo "! "
    exit
fi

exec /bin/bash

