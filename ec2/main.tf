provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

variable "ami_id" {
  type = string
  default = "ami-0d8d212151031f51c"
}

resource "aws_instance" "db_server" {
  ami = var.ami_id
  instance_type = "t2.micro"
}

resource "aws_instance" "web_server" {
  ami = var.ami_id
  instance_type = "t2.micro"
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.web_server.id
}
