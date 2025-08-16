# outputs.tf
output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.my_s3_bucket.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = module.my_s3_bucket.bucket_arn
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.my_vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.my_vpc.subnet_id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.my_ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.my_ec2.instance_public_ip
}

output "ec2_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = module.my_ec2.instance_private_ip
}

output "environment" {
  description = "Current environment"
  value       = var.environment
}

output "workspace" {
  description = "Current Terraform workspace"
  value       = terraform.workspace
}