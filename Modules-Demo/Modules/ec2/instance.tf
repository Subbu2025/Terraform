# To Create a EC2-Instance
resource "aws_instance" "EC2-jenkins" {
  ami = "${var.aws-ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.pub-subnet-id}"
  tags = {Name="ec2-jenkins"}
}
