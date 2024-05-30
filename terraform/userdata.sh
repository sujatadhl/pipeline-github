#!/bin/bash

cd /home
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
ansible-pull -U https://github.com/sujatadhl/pipeline-github.git 





