#!/bin/bash
set -e

# Source the environment file
source /container/env

# Run the build steps
/container/prerequirements.sh
/container/services.sh
/container/packages.sh
/container/cleanup.sh

# Clean up
rm -f /container/cleanup.sh
