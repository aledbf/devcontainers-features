#!/bin/sh

set -e

if [ ! -f "/etc/ssh/sshd_config" ]; then
	echo "Please check the feature ghcr.io/devcontainers/features/sshd is installed."
	exit 1
fi

mkdir -p /etc/gitpod
chmod 664 /etc/gitpod

sed -i -E "s|#?\s*AuthorizedKeysFile\s+.+|AuthorizedKeysFile /etc/gitpod/public-keys|g" /etc/ssh/sshd_config

echo 'done'
