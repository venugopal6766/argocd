#!/bin/bash

# Update package list
sudo apt update

# Install unzip and curl
sudo apt install -y unzip curl

# Download the latest Terraform release
LATEST_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Download Terraform binary
curl -LO "https://releases.hashicorp.com/terraform/${LATEST_VERSION}/terraform_${LATEST_VERSION}_linux_amd64.zip"

# Unzip the Terraform archive
unzip "terraform_${LATEST_VERSION}_linux_amd64.zip"

# Move the Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Add /usr/local/bin to the PATH environment variable
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc

# Refresh the current shell session
source ~/.bashrc

# Verify Terraform installation
terraform version