#!/bin/sh

set -e

if [ ! -f "/etc/ssh/sshd_config" ]; then
	echo "Please check the feature ghcr.io/devcontainers/features/sshd is installed."
	exit 1
fi

cat <<EOF > /etc/ssh/sshd_config.d/gitpod.conf
PermitRootLogin yes

PermitUserEnvironment yes
StrictModes no

#LogLevel DEBUG3

AuthorizedKeysFile /tmp/public-keys

PubkeyAuthentication yes
AuthenticationMethods publickey password
EOF

echo 'done'
