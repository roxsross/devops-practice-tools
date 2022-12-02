#!/bin/bash
sudo apt-get update
sudo apt install -y docker.io
sudo apt install -y git curl wget net-tools 
sudo groupadd docker
sudo usermod -aG docker $USER
DC_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/docker/compose/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker restart
#manual
#sudo usermod -aG docker $USER
#sudo reboot