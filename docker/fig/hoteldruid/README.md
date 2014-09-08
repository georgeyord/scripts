Nginx server with Php-fpm in Docker to run Hoteldruid booking management software using [Fig](http://www.fig.sh)
=====================================================

## Features
 * Path to codebase is set to `./data` folder and can be changed in `fig.yml`
 * Nginx port isset by default to `80` and can be changed in `fig.yml`
 * Nginx logs are persistent and accessible from host in `./log/nginx` folder

## Commands
 * `fig up` to run both services in the foreground
 * `fig up -d` to run both services in the background
 * `fig run [hoteldruid|mysql] env` to check the internal environment variables

## Quick Start the ngbp project
 * Download codebase from http://www.hoteldruid.com/en/download.html to `data` folder
 * `fig up -d` to run nginx server in the background
 * Follow the onscreen instructions
