# devcontainers-features

1. Open a workspace
2. In a terminal run

```
# create a new SSH key (this one will be injected by workspacekit or runner)
ssh-keygen -b 2048 -t rsa -f /home/gitpod/.ssh/id_rsa -q -N ""
chmod 0600 /home/gitpod/.ssh/id_rsa

# install the devcontainer CLI
npm install -g @devcontainers/cli

# build the container
devcontainer build --workspace-folder .

# start the devcontainer
devcontainer up --workspace-folder . --log-level debug

# test we can get access using the node or root user (the only ones in /etc/passwd)
ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -i /home/gitpod/.ssh/id_rsa node@localhost
```
