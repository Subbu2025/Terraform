
# Define an input variable to pass the AWS Accesskey for authentication
variable "aws_access_key" {
  description = "Access Key for AWS"
  type = string
}
# Define an input variable to pass the AWS Secret key for authentication
variable "aws_secret_key" {
  description = "Secret Key for AWS"
  type = string
}

# Define an input variable for the VPC CIDR block
variable "vpc-cidr" {
  description = "CIDR range for vpc"
  type = string
  default = "12.0.0.0/16"
}

# Define an input variable for the AWS region
variable "aws_region" {  
    description = "AWS region"  
    type        = string  
    default     = "us-east-1"
    }

# Define an input variable for the Availability Zone
variable "aws_availability-zone" {
  description = "Availability Zone"
  type = string
  default = "us-east-1a"
}

# Define an input variable for CIDR Blocks for public subnets
variable "public_subnet_cidr_blocks" {
  description = "Available CIDR blocks for public subnets."
  type        = list(string)
  default     = [
    "12.0.1.0/24",
    "12.0.2.0/24",
    "12.0.3.0/24",
    "12.0.4.0/24",
    "12.0.5.0/24",
    "12.0.6.0/24",
    "12.0.7.0/24",
    "12.0.8.0/24",
  ]
}

# Define an input variable for CIDR Blocks for private subnets
variable "private_subnet_cidr_blocks" {
  description = "Available CIDR blocks for private subnets."
  type        = list(string)
  default     = [
    "12.0.101.0/24",
    "12.0.102.0/24",
    "12.0.103.0/24",
    "12.0.104.0/24",
    "12.0.105.0/24",
    "12.0.106.0/24",
    "12.0.107.0/24",
    "12.0.108.0/24",
  ]
}

# Define an input variable for the EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Define an input variable for the EC2 instance AMI ID
variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
  default = "ami-04b70fa74e45c3917"
}

# Define an input variable for ssh key
variable "ssh-key" {
  description = "key for ssh"
  default = "north-virginia-key"
}
variable "private_key_path" {}
