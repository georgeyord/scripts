#!/bin/bash

# Install docker.io
echo "Install docker.io"

DOCKER_COMPOSE_VERSION=1.6.2
DOCKER_MACHINE_VERSION=v0.6.0
KUBECTL_VERSION=1.1.1

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update -y -qq
	apt-get install --assume-yes --force-yes -qq apt-transport-https
fi

if [[ $(which which) == -1 ]]; then
	curl -s https://get.docker.com | sh
fi

apt-get install --assume-yes --force-yes -qq docker-engine

# Add the docker group if it doesn't already exist.
groupadd docker

# Add the default user (uid 1000) to the docker group.
# You may have to logout and log back in again for
# this to take effect.
gpasswd -a $DEFAULT_USER docker

# Restart the Docker daemon.
service docker restart

if [[ $INTERACTIVE == 1 ]] && [[ $(yesNo  "Do you wish to setup Docker access to hub?") == 1 ]]; then
    # This will generate a ~/.dockercfg file
    su $DEFAULT_USER -c "docker login"

    # Set ownership to the default user
    chown -R  $DEFAULT_USER $DEFAULT_USER_PATH/.dockercfg
fi

echo "Install Docker compose"
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Install Docker compose bash completion"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

echo "Install Docker machine"
curl -L https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

echo "Install Kubernetes's kubectl"
curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && \
chmod +x /usr/local/bin/kubectl

saveExecutableToBin ${REPO_SCRIPT_PATH}/files/docker/docker-cleanup-containers.sh docker-cleanup-containers
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/docker/docker-cleanup-images.sh docker-cleanup-images
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/docker/docker-cleanup-volumes.sh docker-cleanup-volumes
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/docker/docker-api.sh docker-api

unset FLAG_INTERACTIVE
