provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5FTZEYL25SDKCU7U"
  secret_key = "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"
}

resource "aws_vpc" "VPC-B" {
  cidr_block = "11.0.0.0/16"
  tags = {Name="vpc-B"}
}
resource "aws_subnet" "public-subnet1" {
  vpc_id = aws_vpc.VPC-B.id
  cidr_block = "11.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {Name="public_subnet1"}
}
resource "aws_subnet" "private-subnet1" {
  vpc_id = aws_vpc.VPC-B.id
  cidr_block = "11.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {Name="private_subnet1"}
}

resource "aws_internet_gateway" "ig-vpcb" {
  vpc_id = aws_vpc.VPC-B.id
  tags = {Name="ig-VPCB"}
}
resource "aws_route_table" "rt_public_vpc-b" {
    vpc_id = aws_vpc.VPC-B.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-vpcb.id
  }
  tags = {Name="RT_Public_VPC-B"}
}
resource "aws_route_table_association" "public-subnet1-rt-a" {
  subnet_id = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.rt_public_vpc-b.id
}
resource "aws_security_group" "sg-web" {
  name = "HTTP and SSH"
  vpc_id = aws_vpc.VPC-B.id
  ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
   from_port = 0
   to_port = 0
   protocol = -1
   cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "aws-tf-web-instance-demo" {
  ami = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "north-virginia-key"

  subnet_id = aws_subnet.public-subnet1.id
  vpc_security_group_ids = [aws_security_group.sg-web.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash -ex
 sudo apt update
 sudo apt upgrade
 sudo apt install nginx
 echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
  sudo systemctl enable nginx
  sudo systemctl start nginx
  EOF

  tags = {
    "Name" : "Kanye"
  }
}