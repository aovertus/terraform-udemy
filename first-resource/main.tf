provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

output "arn" {
  value = aws_vpc.myvpc.arn
}
