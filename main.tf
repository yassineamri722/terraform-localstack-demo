terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  s3_use_path_style = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}
module "my_s3_bucket" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}
module "my_vpc" {
  source = "./modules/vpc"

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  
}
module "my_ec2" {
  source = "./modules/ec2"

  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = module.my_vpc.subnet_id
}