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

# Let's go to our host directory, where all the files are.
cd /mnt

echo "# "
echo "# Welcome to the Star Trek: TNG: A Final Unity Utilities Docker Container!"
echo "# "

FILE="STTNG.ZIP"
shopt -s nocaseglob

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

shopt -u nocaseglob  # Reset to case-sensitive matching (optional)

echo "# "
echo "# The host filesystem is in: /mnt"
echo "# Utilities are in: /mnt/bin/ and /mnt/external-tools/"
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

