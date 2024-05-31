#!/bin/bash
set -euxo pipefail
source /container/env

# Clean apt cache
apt-get clean

# Delete everything in /container apart from `env` and `cleanup.sh`
find /container/ -mindepth 1 \
    ! -name 'env' \
    ! -name 'cleanup.sh' \
    -exec rm -rf {} +

# Remove temporary files
rm -rf /tmp/* /var/tmp/*

# Remove apt lists to reduce image size
rm -rf /var/lib/apt/lists/*

# Clean up Python bytecode and __pycache__ directories
find / -mount -name '*.pyc' -delete
find / -mount -name '__pycache__' -delete

# Remove SSH host keys
rm -f /etc/ssh/ssh_host_*
