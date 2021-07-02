provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

resource "aws_instance" "ec2" {
  ami = "ami-0d8d212151031f51c"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

output "eip" {
  value = aws_eip.elasticeip.public_ip
}
