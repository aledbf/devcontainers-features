#!/bin/sh

set -e

mkdir -p /etc/gitpod
chmod 664 /etc/gitpod

sed -i -E "s|#?\s*AuthorizedKeysFile\s+.+|AuthorizedKeysFile /etc/gitpod/public-keys|g" /etc/ssh/sshd_config

echo 'done'
