#!/bin/bash
set -euxo pipefail
source /container/env

# Install often used tools
mini-apt-install \
    bat \
    curl \
    dirmngr \
    expect \
    git \
    gpg-agent \
    inetutils-ping \
    jq \
    less \
    netcat-openbsd \
    plocate \
    psmisc \
    python3-minimal \
    python3-pip \
    rsync \
    sudo \
    unzip \
    vim-tiny \
    wget \
    zip \
    zsh

# Install `setuser` tool to run commands as another user and set $HOME
install -m 755 /container/bin/setuser /sbin/setuser

# Install `install-clean` tool for apt packages with automatic cache cleanup
install -m 755 /container/bin/install-clean /sbin/install-clean
