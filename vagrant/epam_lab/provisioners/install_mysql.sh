#!/bin/bash

DATABASE=wordpress
USER=wordpress
PASSWRD=simple

sudo apt-get update
sudo apt-get install -y mysql-server # python3-mysqldb

sudo mysql -e "CREATE DATABASE ${DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
sudo mysql -e "CREATE USER ${USER}@localhost IDENTIFIED BY '${PASSWRD}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"
