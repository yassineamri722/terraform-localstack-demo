variable "bucket_name" {
  type        = string
  default     = "my-local-bucket"
  
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}
variable "subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
}
variable "ec2_ami" {
  type        = string
  default     = "ami-12345678"
}
variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
}