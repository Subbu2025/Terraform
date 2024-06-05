# To create a VPC
resource "aws_vpc" "Proj1-vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  tags = {Name="proj1-vpc"}
}

# To create a Public Subnet
resource "aws_subnet" "proj1-pub-subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"
   tags = {Name="proj1-vpc-pub-subnet"}
}
