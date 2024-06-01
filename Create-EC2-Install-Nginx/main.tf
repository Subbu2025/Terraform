# To create a VPC
resource "aws_vpc" "vpc-c" {
  cidr_block = var.vpc-cidr
  tags = {Name="vpc-c"}
}
# To create a Public-Subnet
resource "aws_subnet" "public-subnet1" {
  vpc_id = aws_vpc.vpc-c.id
  cidr_block = element(var.public_subnet_cidr_blocks,2)
  availability_zone = var.aws_availability-zone
  tags = {Name="vpc-c-public_subnet1"}
}

# To create a Public-Subnet
resource "aws_subnet" "private-subnet1" {
  vpc_id = aws_vpc.vpc-c.id
  cidr_block = element(var.private_subnet_cidr_blocks,2)
  availability_zone = var.aws_availability-zone
  tags = {Name="vpc-c-private_subnet1"}
}
# To create an Internet Gateway
resource "aws_internet_gateway" "ig-vpc-c" {
  vpc_id = aws_vpc.vpc-c.id
  tags = {Name="ig-VPC-C"}
}

# To create a Route Table for public subnet
resource "aws_route_table" "rt_public_subnet" {
    vpc_id = aws_vpc.vpc-c.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-vpc-c.id
  }
  tags = {Name="RT_vpc-c-Public-subnet"}
}

# To assoscite a route table with the public subnet
resource "aws_route_table_association" "public-subnet1-rt" {
  subnet_id = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.rt_public_subnet.id
}

# To create a security group
resource "aws_security_group" "sg-web-nginx" {
  name = "HTTP and SSH for Nginx"
  vpc_id = aws_vpc.vpc-c.id
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
# To create an ec2-instance
resource "aws_instance" "aws-tf-nginx-instance-demo" {
  ami = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.aws_availability-zone
  key_name = var.ssh-key
  subnet_id = aws_subnet.public-subnet1.id
  vpc_security_group_ids = [aws_security_group.sg-web-nginx.id]
  associate_public_ip_address = true
  provisioner "remote-exec" {
    inline = [ 
    "sudo apt update && sudo apt upgrade -y < /dev/null && sudo apt install nginx -y < /dev/null",
    #"echo "<h1>Hello World...!</h1>"" > /usr/share/nginx/html/index.html",
    "sudo systemctl enable nginx",
    "sudo systemctl start nginx"
         ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./north-virginia-key.pem")
    host        = self.public_ip
  }
  tags = {
    "Name" : "tf-aws-instance-nginx-web-demo"
  } 
}
resource "aws_dynamodb_table" "terraform-lock" {
  name = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
