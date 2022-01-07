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
        echo "Site down...  Attempting to restart server."
        aws ec2 stop-instances --instance-ids=i-062212f5e9bd22a63
        while [ "stopped" != "$(aws ec2 describe-instances --instance-ids=i-062212f5e9bd22a63 --output text --query 'Reservations[].Instances[].State.Name')" ]; do
            echo "Waiting for server to stop."
            sleep 10;
        done;
        aws ec2 start-instances --instance-ids=i-062212f5e9bd22a63
        while [ "running" != "$(aws ec2 describe-instances --instance-ids=i-062212f5e9bd22a63 --output text --query 'Reservations[].Instances[].State.Name')" ]; do
            echo "Waiting for server to start."
            sleep 10;
        done;
    fi;
    echo "Sleeping for a half hour.  Last checked: "$(date)
    sleep 1800;
done;