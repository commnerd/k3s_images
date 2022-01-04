#!/bin/bash
set -e

# Create .aws directory
mkdir -p /root/.aws

echo "[default]" > /root/.aws/credentials
echo "aws_access_key_id = $(cat /tmp/creds/aws_access_key_id)" >> /root/.aws/credentials
echo "aws_secret_access_key = $(cat /tmp/creds/aws_secret_access_key)" >> /root/.aws/credentials

echo "[default]" > /root/.aws/config
echo "region = $(cat /tmp/config/region)" >> /root/.aws/config
echo "output = $(cat /tmp/config/output)" >> /root/.aws/config

chown -fR root:root /root/.aws

while [ 1 ]; do
    if [ ! "$(curl https://michaeljmiller.net/alive)" ]; then
        aws ec2 reboot-instances --instance-ids=i-062212f5e9bd22a63
        sleep 300
        # while [ "stopped" != "$(aws ec2 describe-instances --instance-ids=i-062212f5e9bd22a63 --output text --query 'Reservations[].Instances[].State.Name')" ]; do
        #     sleep 10;
        # done;
    fi;
done;