variable "ami_id" {
  type = string
  default = "ami-0d8d212151031f51c"
}

variable "ec2_name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = var.ami_id
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2_name
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
