#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

cd /home
sudo yum update -y

if ! command -v python3.8 &> /dev/null; then
    sudo amazon-linux-extras install -y python3.8
fi

sudo python3.8 -m ensurepip
sudo python3.8 -m pip install --upgrade pip
sudo yum install git 

sudo python3.8 -m pip install ansible

ansible-pull -U https://github.com/sujatadhl/pipeline-github.git -i aws_ec2.yml -C github-actions ansible/playbook.yml
