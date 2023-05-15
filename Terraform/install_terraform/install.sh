#!/bin/bash
#!/bin/bash

# Update package list
sudo apt update

# Install prerequisites
sudo apt install -y gnupg software-properties-common curl

# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg

# Add the official HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

# Update package list again
sudo apt update

# Install Terraform
sudo apt install -y terraform

# Verify Terraform installation
terraform version
