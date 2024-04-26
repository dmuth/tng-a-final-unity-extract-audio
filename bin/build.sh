#!/bin/bash
# 
# Build our Docker container
#

# Errors are fatal
set -e

# Change to the parent directory
pushd $(dirname $0)/.. > /dev/null

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

docker build -t sttng .


