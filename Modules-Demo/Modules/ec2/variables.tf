# Input Variable for AMI
variable "aws-ami" {
  description = "AMI for EC2 Instance"
  type = string
  default = "ami-04b70fa74e45c3917"
}

# Input Variable for Instance Type
variable "instance_type" {
  description = "Instance Type"
  type = string
  default = "t2.micro"
}

# Input Variable for public subnet id
variable "pub-subnet-id" {
  description = "Public Subnet Id"

}
