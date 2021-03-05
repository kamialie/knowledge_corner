#!/bin/bash

sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress
sudo service restart nginx
