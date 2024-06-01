# To ge the VPC_ID
output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.vpc-c.id
}

# To get ID of the Instance

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.aws-tf-nginx-instance-demo.id
}

# To get the Public IP address of the Instance
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.aws-tf-nginx-instance-demo.public_ip
}
