terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.region
  access_key                  = "test"
  secret_key                  = "test"
  s3_use_path_style          = true
  skip_credentials_validation = true
  skip_metadata_api_check    = true
  skip_requesting_account_id = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

# S3 Module
module "s3_bucket" {
  source = "./modules/s3"
  
  bucket_name = "${var.bucket_name}-${terraform.workspace}"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"
  
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  
  depends_on = [module.vpc]
}