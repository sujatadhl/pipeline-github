#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

cd /home

# Update system
sudo yum update -y

# Install Python 3.8 if not already installed
if ! command -v python3.8 &> /dev/null; then
    # Enable the extras repository for Amazon Linux 2
    sudo amazon-linux-extras install -y python3.8
fi

# Ensure pip is installed and upgraded
sudo python3.8 -m ensurepip
sudo python3.8 -m pip install --upgrade pip
sudo yum install git 

# Install Ansible
sudo python3.8 -m pip install ansible

# Pull and run Ansible playbook
ansible-pull -U https://github.com/sujatadhl/pipeline-github.git -i aws_ec2.yml -C github-actions ansible/playbook.yml
