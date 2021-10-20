#!/bin/bash
set -e

# Copy and assign ownership to root for container run
cp -fR /tmp/.ssh /root/.ssh

dockerd &

git clone https://github.com/commnerd/k3s_images.git

cd ./k3s_images

make push

make clean
