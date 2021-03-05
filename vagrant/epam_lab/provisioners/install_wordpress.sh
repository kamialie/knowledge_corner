#!/bin/bash

sudo apt-get install -y php7.2-curl \
						php7.2-gd \
						php7.2-cli \
						php7.2-fpm \
						php7.2-mysql \
						php7.2-json \
						php7.2-opcache \
						php7.2-mbstring \
						php7.2-xml

cd /var/www
sudo curl https://wordpress.org/latest.tar.gz --output wordpress.tar.gz
sudo tar xvf wordpress.tar.gz

sudo chown -R www-data:www-data wordpress
sudo find wordpress -type d -exec chmod 750 {} \;
sudo find wordpress -type f -exec chmod 640 {} \;
