#!/bin/bash
# 
# Build our Docker container
#

# Errors are fatal
set -e

# Change to the parent directory
pushd $(dirname $0)/.. > /dev/null

docker build -t sttng .


