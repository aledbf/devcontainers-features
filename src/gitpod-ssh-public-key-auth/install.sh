#!/bin/sh

set -e

if [ ! -f "/etc/ssh/sshd_config" ]; then
	echo "Please check the feature ghcr.io/devcontainers/features/sshd is installed."
	exit 1
fi

mkdir -p /etc/gitpod --mode=0744

cat <<EOF > /etc/ssh/sshd_config.d/gitpod
PermitRootLogin yes

PermitUserEnvironment yes
StrictModes no

#LogLevel DEBUG3

AuthorizedKeysFile /etc/gitpod/public-keys

PubkeyAuthentication yes
AuthenticationMethods publickey password
EOF

echo 'done'
