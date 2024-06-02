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
   user_data = file("userdata.sh")
}

# #S3 Bucket
# resource "aws_s3_bucket" "sujata_pipeline" {
#     bucket = var.bucket_name  
# }
