module "ec2" {
  for_each = var.name
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.5.0"
  instance_type               = var.instance_type
  ami                         = var.ami_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.sg_id
  subnet_id                   = var.subnet_id 
  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_description = "SSM Role for accessing EC2 instance"
  iam_role_policies = {
    SSM = var.ssm_policy
  }
  key_name = try(var.key_name, null)
  tags = {
    Name = each.value
  }
    user_data=base64encode(<<-EOF
  #!/bin/bash
    sudo yum update -y

    sudo amazon-linux-extras install -y python3.8

    sudo python3.8 -m ensurepip
    sudo python3.8 -m pip install --upgrade pip
    sudo yum install git 

    sudo python3.8 -m pip install ansible
    python3.8 -m pip install botocore
    python3.8 -m pip install boto3

    ansible-pull -U https://github.com/sujatadhl/pipeline-github.git -i aws_ec2.yml -C github-actions ansible/playbook.yml

    EOF
    )
}

# #S3 Bucket
# resource "aws_s3_bucket" "sujata_pipeline" {
#     bucket = var.bucket_name  
# }
