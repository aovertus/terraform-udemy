provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

variable "input_vpc-name" {
  type = string
  description = "Provide vpc name"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = var.input_vpc-name
  }
}

output "arn" {
  value = aws_vpc.myvpc.arn
}

#  ami-0d8d212151031f51c
