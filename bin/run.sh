#!/bin/bash
# 
# Run our Docker container interactively
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

# Change to the parent directory
pushd $(dirname $0)/.. > /dev/null

docker run -it -v $(pwd):/mnt sttng $@

