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
  security_groups = [aws_security_group.allow_web.name]

  user_data = file("server-script.sh")
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.web_server.id
}

variable "web_ports" {
  type = list(number)
  default = [80, 443]
}

resource "aws_security_group" "allow_web" {
  name = "Allow Web"

  dynamic "ingress" {
    iterator = port
    for_each = var.web_ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.web_ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "db_server_ip" {
  value = aws_instance.db_server.private_ip
}

output "web_server_ip" {
  value = aws_eip.my_eip.public_ip
}
