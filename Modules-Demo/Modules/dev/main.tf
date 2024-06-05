# Create a VPC from the VPC Module
module "my-vpc" {
  source = "../modules/vpc"
  aws_access_key = ""
  aws_secret_key = ""
  aws_region = ""
  vpc_id = "${module.my-vpc.vpc-id}"
  vpc_cidr_block = "192.168.0.0/16"
  subnet_cidr = "192.168.1.0/24"
}
# Create an EC2 Instance from the ec2 module
module "my-ec2" {
  source = "../modules/ec2"
  pub-subnet-id = "${module.my-vpc.subnet-id}"
  instance_type = "t2.micro"
  aws-ami = "ami-04b70fa74e45c3917"
}
