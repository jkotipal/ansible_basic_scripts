#!/bin/bash

# Clear the terminal for readability
clear
set -e

# Update and upgrade packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Python3, pip, and venv
sudo apt-get install -y python3 python3-pip python3-venv

# Create and activate a virtual environment
python3 -m venv ~/.env
source ~/.env/bin/activate

# Install boto3 inside the virtual environment
pip install boto3

# Install dependencies and Ansible
sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Install Git
sudo apt-get install -y git

#install aws CLI using curl command
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Display versions to verify installation
echo
echo "Installed Versions:"
python3 --version
pip3 --version
ansible --version | head -n 1
git --version
~/.env/bin/python -m pip show boto3 | grep Version

