#!/bin/sh

set -e

ARCH=$(uname -m)
TARGET=""

if [ "$1" != "" ]
then
	exec "$@"
	exit;
fi

case $ARCH in
	"aarch64")
		TARGET="linux_arm64"
		;;

	"x86_64")
		TARGET="linux_amd64"
		;;
esac

mkdir -p /var/log/supervisord

touch /var/log/supervisord/supervisord.log

sed -i "s/\/target\//\/$TARGET\//g" /etc/supervisord.conf

supervisord -nc /etc/supervisord.conf
