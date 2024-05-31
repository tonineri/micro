#!/bin/bash
set -ex
source /container/env

# Prevent initramfs updates from trying to run `grub` and `lilo`
export INITRD=no
mkdir -p /etc/container_environment
echo -n no > /etc/container_environment/INITRD

# Enable Ubuntu Universe, Multiverse, and deb-src for main
if grep -E '^ID=' /etc/os-release | grep -qi ubuntu; then
  sed -i 's/^#\s*\(deb.*main restricted\)$/\1/g' /etc/apt/sources.list
  sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
  sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list
fi

apt-get update

# Fix some issues with APT packages
dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl

# Replace the 'ischroot' tool to make it always return true
dpkg-divert --local --rename --add /usr/bin/ischroot
ln -sf /bin/true /usr/bin/ischroot

# Install necessary packages
mini-apt-install \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# Upgrade all packages
apt-get dist-upgrade -y --no-install-recommends -o Dpkg::Options::="--force-confold"

# Fix locale based on distribution
if grep -E '^ID=' /etc/os-release | grep -qi ubuntu; then
  mini-apt-install language-pack-en
elif grep -E '^ID=' /etc/os-release | grep -qi debian; then
  mini-apt-install locales locales-all
fi

locale-gen en_US
update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

# Save locale settings to environment
echo -n en_US.UTF-8 > /etc/container_environment/LANG
echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE
