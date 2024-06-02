#!/bin/bash

cd /home/ssm-user/
sudo yum update -y

sudo amazon-linux-extras install -y python3.8

sudo python3.8 -m ensurepip
sudo python3.8 -m pip install --upgrade pip
sudo yum install git 

sudo python3.8 -m pip install ansible

ansible-pull -U https://github.com/sujatadhl/pipeline-github.git -i aws_ec2.yml -C github-actions ansible/playbook.yml
