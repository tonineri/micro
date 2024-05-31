#!/bin/bash
set -euxo pipefail
source /container/env

# Install often used tools
mini-apt-install \
    batcat \
    curl \
    less \
    vim-tiny \
    psmisc \
    gpg-agent \
    dirmngr \
    wget

# Install `setuser` tool to run commands as another user and set $HOME
install -m 755 /container/bin/setuser /sbin/setuser

# Install `install-clean` tool for apt packages with automatic cache cleanup
install -m 755 /container/bin/install-clean /sbin/install-clean
