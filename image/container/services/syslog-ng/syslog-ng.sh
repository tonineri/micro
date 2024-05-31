#!/bin/bash
set -ex
source /container/env

SYSLOG_NG_BUILD_PATH=/container/services/syslog-ng

# Install syslog-ng core
mini-apt-install syslog-ng-core

# Copy init and shutdown scripts
install -m 755 $SYSLOG_NG_BUILD_PATH/syslog-ng.init /etc/minit.d/10_syslog-ng.init
install -m 755 $SYSLOG_NG_BUILD_PATH/syslog-ng.shutdown /etc/minit_post-shutdown.d/10_syslog-ng.shutdown

# Copy additional files
install -m 644 $SYSLOG_NG_BUILD_PATH/smart-multi-line.fsm /usr/share/syslog-ng/smart-multi-line.fsm
install -d /var/lib/syslog-ng
install -m 644 $SYSLOG_NG_BUILD_PATH/syslog_ng_default /etc/default/syslog-ng

# Setup syslog file and permissions
install -m 640 -o root -g adm /dev/null /var/log/syslog

# Copy syslog-ng configuration
install -m 644 $SYSLOG_NG_BUILD_PATH/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

# Install logrotate
mini-apt-install logrotate

# Copy logrotate configuration
install -m 644 $SYSLOG_NG_BUILD_PATH/logrotate.conf /etc/logrotate.conf
install -m 644 $SYSLOG_NG_BUILD_PATH/logrotate_syslogng /etc/logrotate.d/syslog-ng
