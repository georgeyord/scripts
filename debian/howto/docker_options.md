# Change Docker service starting options

* Edit `sudo vim /etc/default/docker` to taste
* Restart Docker service `sudo service docker restart`

## Example default docker file with more options 

```
# Docker Upstart and SysVinit configuration file

# Customize location of Docker binary (especially for development testing).
#DOCKER="/usr/local/bin/docker"

# Use DOCKER_OPTS to modify the daemon startup options.
#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"
DOCKER_OPTS="--insecure-registry registry:5000"
DOCKER_OPTS="$DOCKER_OPTS -H 0.0.0.0:2375 -H unix:///var/run/docker.sock"
DOCKER_OPTS="$DOCKER_OPTS --bip=172.17.42.1/16 --dns=172.17.42.1"

# If you need Docker to use an HTTP proxy, it can also be specified here.
#export http_proxy="http://127.0.0.1:3128/"

# This is also a handy place to tweak where Docker's temporary files go.
#export TMPDIR="/mnt/bigdrive/docker-tmp"
```
