# To get the output of VPC ID
output "vpc-id" {
    value = "${aws_vpc.Proj1-vpc.id}"
} 
# To get the output of subnet ID
output "subnet-id" {
  value = "${aws_subnet.proj1-pub-subnet.id}"
}
