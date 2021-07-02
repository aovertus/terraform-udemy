provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami = "ami-0d8d212151031f51c"
  instance_type = "t2.micro"
  count = var.number_of_servers
}
