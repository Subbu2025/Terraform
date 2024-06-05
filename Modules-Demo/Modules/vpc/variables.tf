# Input Variables for Provider
# Define an input variable for aws-region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}
# Define an input variable for access-key
variable "aws_access_key" {
  description = "AWS Access Key"
  type = string
}
# Define an input variable for access-key
variable "aws_secret_key" {
  description = "AWS Secret Key"
  type = string
}
# Input Variables for VPC creation
variable "vpc_cidr_block" {
  description = "CIDR Range for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_id" {}

# Input Variables for Public Subnet creation
variable "subnet_cidr" {
  description = "CIDR Range for Public Subnet"
  type = string
  default = "10.0.1.0/24"
}


