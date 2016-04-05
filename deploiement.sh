#!/bin/sh
echo "update"
sudo apt-get update -y > /dev/null 2>&1
echo "upgrade"
sudo apt-get upgrade -y  > /dev/null 2>&1
echo "installation de redis-server"
sudo apt-get -y install -y redis-server > /dev/null 2>&1
echo "Etat:"
sudo service redis-server status
echo "lancer redis-server"
sudo service redis-server restart
