#!/bin/bash

sudo apt-get install -y nginx
sudo service nginx enable 

sudo mv /home/vagrant/nginx.conf /etc/nginx/nginx.conf
sudo mv /home/vagrant/wordpress /etc/nginx/sites-available/wordpress
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress
sudo rm /etc/nginx/sites-enabled/default

sudo openssl req -x509 -days 365 -config /vagrant/files/openssl.cfg -out /etc/ssl/certs/nginx-selfsigned.crt
sudo mv nginx-selfsigned.key /etc/ssl/private
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

sudo service nginx restart
