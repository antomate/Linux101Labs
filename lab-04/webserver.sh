#!/bin/bash

# Update package source
logger "Update package source"
apt -y update

# Install NGINX
logger "Install NGINX"
apt -y install nginx

# Enable 80 inbound
logger "Enable 80 inbound"
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Rename default Ngnix home page
logger "Rename default Ngnix home page"
if [ ! -f /var/www/html/index.nginx-debian.html ]
then
    mv /var/www/html/index.nginx-debian.html /var/www/html/index.nginx-debian.html.old
fi

# Download a new home page
logger "Download a new home page"
wget https://raw.githubusercontent.com/stevensams/homepage/master/index.html -O /var/www/html/index.html
wget https://raw.githubusercontent.com/stevensams/homepage/master/style.css -O /var/www/html/style.css

# Modify home page
logger "Modify home page"
sed -i 's/Steven Sams/John Doe/g' /var/www/html/index.html