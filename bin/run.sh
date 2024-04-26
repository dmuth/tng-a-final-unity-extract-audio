#!/bin/bash
# 
# Run our Docker container interactively
#

# Errors are fatal
set -e

# Change to the parent directory
pushd $(dirname $0)/.. > /dev/null

docker run -it -v $(pwd):/mnt sttng $@

