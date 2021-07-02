provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

resource "aws_instance" "web" {
  ami = "ami-0d8d212151031f51c"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

  depends_on = [
    aws_instance.db
  ]
}

resource "aws_instance" "db" {
  ami = "ami-0d8d212151031f51c"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}
