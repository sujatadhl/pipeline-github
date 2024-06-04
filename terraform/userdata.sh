#!/bin/bash
sudo yum update -y

sudo amazon-linux-extras install -y python3.8

sudo python3.8 -m ensurepip
sudo python3.8 -m pip install --upgrade pip

sudo python3.8 -m pip install ansible
sudo amazon-linux-extras install -y awscli

aws s3 cp s3://sujata-backend/ansible /home/ansible --recursive

cd /home/ansible
ansible-playbook -i aws_ec2.yml playbook.yml
