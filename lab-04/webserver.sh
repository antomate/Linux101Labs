#!/bin/bash

# update package source
apt-get -y update

# install NGINX
apt-get -y install nginx

# Enable 80 inbound
ufw allow 80/tcp

# Download a new index page