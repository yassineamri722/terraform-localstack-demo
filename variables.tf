# variables.tf
variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

# Local values for workspace-specific configurations
locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"
  
  # Environment-specific tags
  default_tags = merge(var.common_tags, {
    Environment = var.environment
    Workspace   = terraform.workspace
    Project     = "localstack-demo"
    ManagedBy   = "terraform"
  })
}