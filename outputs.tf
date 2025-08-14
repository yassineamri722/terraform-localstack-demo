output "s3_bucket_name" {
  value = module.my_s3_bucket.bucket_name
}   
output "vpc_id" {
  value = module.my_vpc.vpc_id
}
output "subnet_id" {
  value = module.my_vpc.subnet_id
}
output "ec2_instance_id" {
  value = module.my_ec2.instance_id
}