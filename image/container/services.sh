#!/bin/bash
set -euxo pipefail
source /container/env

# Install init process
install -m 755 /container/bin/minit /sbin/minit
mkdir -p /etc/minit.d /etc/minit_pre-shutdown.d /etc/minit_post-shutdown.d /etc/container_environment
touch /etc/container_environment.sh /etc/container_environment.json
chmod 700 /etc/container_environment

# Create docker_env group and set permissions
groupadd -g 8377 docker_env
chown :docker_env /etc/container_environment.sh /etc/container_environment.json
chmod 640 /etc/container_environment.sh /etc/container_environment.json
ln -s /etc/container_environment.sh /etc/profile.d/

# Install runit
mini-apt-install runit

# Install syslog daemon and logrotate if not disabled
if [ "${DISABLE_SYSLOG:-1}" -eq 0 ]; then
  /container/services/syslog-ng/syslog-ng.sh
fi

# Install SSH server if not disabled
if [ "${DISABLE_SSH:-1}" -eq 0 ]; then
  /container/services/sshd/sshd.sh
fi

# Install cron daemon if not disabled
if [ "${DISABLE_CRON:-1}" -eq 0 ]; then
  /container/services/cron/cron.sh
fi
