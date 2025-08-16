# modules/ec2/variables.tf
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will be launched"
  type        = string
}

variable "instance_name" {
  description = "Name for the EC2 instance"
  type        = string
  default     = "instance"
}



variable "tags" {
  description = "Tags to be applied to EC2 resources"
  type        = map(string)
  default     = {}
}