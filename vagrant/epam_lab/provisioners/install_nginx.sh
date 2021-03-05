#!/bin/bash

sudo apt-get install -y nginx
sudo service nginx enable 

sudo mv /home/vagrant/nginx.conf /etc/nginx/nginx.conf
sudo mv /home/vagrant/wordpress /etc/nginx/sites-available/wordpress
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress
sudo rm /etc/nginx/sites-enabled/default

sudo service nginx restart
