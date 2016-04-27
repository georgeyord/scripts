#!/bin/bash

echo -e "\n*** Install Docker"

DOCKER_COMPOSE_VERSION=1.6.2
DOCKER_MACHINE_VERSION=v0.6.0
KUBECTL_VERSION=1.1.1

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update -y -qq
	apt-get install --assume-yes --force-yes -qq apt-transport-https
fi

if [[ $(which docker) == -1 ]]; then
	curl -s https://get.docker.com | sh
fi

apt-get install -f -qq;
apt-get install --assume-yes --force-yes -qq docker-engine

ensureAppExists "docker"

# Add the docker group if it doesn't already exist.
groupadd docker

# Add the default user (uid 1000) to the docker group.
# You may have to logout and log back in again for
# this to take effect.
gpasswd -a $DEFAULT_USER docker

echo "Install Docker compose"
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ensureAppExists "docker-compose"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

echo "Install Docker compose bash completion"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

echo "Install Docker machine"
curl -L https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine
ensureAppExists "docker-machine"

echo "Install Kubernetes's kubectl"
curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && \
chmod +x /usr/local/bin/kubectl
ensureAppExists "kubectl"

# Restart the Docker daemon.
service docker restart

if [[ $INTERACTIVE == 1 ]] && [[ $(yesNo  "Do you wish to setup Docker access to hub?") == 1 ]]; then
    # This will generate a ~/.dockercfg file
    su $DEFAULT_USER -c "docker login"

    # Set ownership to the default user
    chown -R  $DEFAULT_USER $DEFAULT_USER_PATH/.dockercfg
fi

saveExecutableToBin ${REPO_SCRIPT_PATH}/docker/docker-cleanup-containers.sh docker-cleanup-containers
saveExecutableToBin ${REPO_SCRIPT_PATH}/docker/docker-cleanup-images.sh docker-cleanup-images
saveExecutableToBin ${REPO_SCRIPT_PATH}/docker/docker-cleanup-volumes.sh docker-cleanup-volumes
saveExecutableToBin ${REPO_SCRIPT_PATH}/docker/docker-api.sh docker-api
saveAlias ${REPO_SCRIPT_PATH}/docker/docker-alias.sh

unset FLAG_INTERACTIVE
