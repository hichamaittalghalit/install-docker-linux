#!/bin/bash

#INSTALL DEPENDENCIES
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

#ADD PPA
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#INSTALL DOCKER-CE
sudo apt-get update
sudo apt-get install -y docker-ce git-all

#INSTALL DOCKER-COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/$1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#LINUX POST-INSTALL
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

