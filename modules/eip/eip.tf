variable "ec2_id" {
  type = string
}

resource "aws_eip" "my_eip" {
  instance = var.ec2_id
}

output "public_ip" {
  value = aws_eip.my_eip.public_ip
}
