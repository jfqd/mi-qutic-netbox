#!/bin/bash
# Configure ruby ssh authorized_keys file if available via mdata

if mdata-get netbox_authorized_keys 1>/dev/null 2>&1; then
  home='/home/ruby'
  mkdir -p ${home}/.ssh
  echo "# This file is managed by mdata-get netbox_authorized_keys" \
    > ${home}/.ssh/authorized_keys
  mdata-get netbox_authorized_keys >> ${home}/.ssh/authorized_keys
  chmod 700 ${home}/.ssh
  chmod 644 ${home}/.ssh/authorized_keys
  chown ruby:ruby ${home}/.ssh/authorized_keys
fi
