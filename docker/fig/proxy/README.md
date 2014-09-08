Nginx server used as Proxypass in Docker container using [Fig](http://www.fig.sh)
=====================================================

## Features
 * Nginx port isset by default to `80` and can be changed in `fig.yml`
 * Nginx auto-created configuration file is persistent and accessible from host in `./conf/default` (don't edit, will be deleted when new nginx Docker containers run)

## Commands
 * `fig up` to run both services in the foreground
 * `fig up -d` to run both services in the background
 * `fig run nginx env` to check the internal environment variables