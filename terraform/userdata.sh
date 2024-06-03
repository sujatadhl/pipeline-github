#!/bin/bash
sudo yum update -y

sudo amazon-linux-extras install -y python3.8

sudo python3.8 -m ensurepip
sudo python3.8 -m pip install --upgrade pip
sudo yum install git 

sudo python3.8 -m pip install ansible
sudo yum install awscli

aws cp s3://sujata-backen/ansible cd /home

ansible-playbook -i aws_ec2.yml playbook.yml
