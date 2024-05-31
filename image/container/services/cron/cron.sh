#!/bin/bash
set -ex
source /container/env

# Install cron package
mini-apt-install cron

# Setup cron service
mkdir -p /etc/service/cron
chmod 600 /etc/crontab
cp /container/services/cron/cron.runit /etc/service/cron/run

# Fix cron issues in version 0.9.19
# Reference: https://github.com/phusion/baseimage-docker/issues/345
sed -i 's/^\s*session\s\+required\s\+pam_loginuid.so/# &/' /etc/pam.d/cron

# Remove unnecessary cron entries
for cron_file in /etc/cron.daily/standard \
                 /etc/cron.daily/upstart \
                 /etc/cron.daily/dpkg \
                 /etc/cron.daily/password \
                 /etc/cron.weekly/fstrim \
                 /etc/cron.d/e2scrub_all; do
    [ -e "$cron_file" ] && rm -f "$cron_file"
done
