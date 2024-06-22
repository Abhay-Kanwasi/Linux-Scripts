#!/bin/bash

# Update package information
sudo apt update

# Install necessary packages for Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's official APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package information again to include Docker's repository
sudo apt update

# Check the available versions of Docker
apt-cache policy docker-ce

# Install Docker
sudo apt install docker-ce -y

# Additional commands
sudo apt update
sudo apt install ca-certificates curl -y

# Create the directory for the Docker keyring
sudo install -m 0755 -d /etc/apt/keyrings

# Download the Docker GPG key to the keyring
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Set the permissions for the Docker GPG key
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker's repository to the sources list
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package information to include the new Docker repository
sudo apt update

# Install Docker Compose plugin
sudo apt install docker-compose-plugin -y

# Add current user to the docker group
sudo usermod -aG docker $USER

# Inform the user to log out and log back in for the changes to take effect
echo "Please log out and log back in to apply the user group changes, or run 'newgrp docker' to apply the changes immediately."
