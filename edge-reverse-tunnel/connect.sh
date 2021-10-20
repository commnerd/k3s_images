#!/bin/bash
set -e

# Copy and assign ownership to root for container run
cp -fR /tmp/.ssh /root/.ssh

chown -fR root:root /root/.ssh

chmod 600 /root/.ssh/*

ssh -i /root/.ssh/${AUTH_KEY_FILE} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -R ${BIND_PORT}:${DEST}:${DEST_PORT} -N ${USER}@${SERVER}
