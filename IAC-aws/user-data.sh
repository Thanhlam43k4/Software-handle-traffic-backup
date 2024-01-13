#!/bin/bash
echo "Hello World" > hi.txt
sudo yum update -y
sudo yum install docker -y
sudo yum install git -y
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker 
sudo systemctl start docker 
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Print Docker Compose version
