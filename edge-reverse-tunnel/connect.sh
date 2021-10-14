#!/bin/bash
set -e

AUTH_KEY_FILE=$1
BIND_PORT=$2
DEST=$3
DEST_PORT=$4
USER=$5
SERVER=$6

# Copy and assign ownership to root for container run
cp -fR /tmp/.ssh /root/.ssh

ssh -i /root/.ssh/${AUTH_KEY_FILE} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -L ${BIND_PORT}:${DEST}:${DEST_PORT} -4N ${USER}@${SERVER} -N
