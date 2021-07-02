provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}


variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string)
  default = ["Value1", "Value2"]
}

variable "mymap" {
  type = map
  default = {
    Key1 = "Value1",
    Key2 = "Value2",
   }
}

variable "inputname" {
  type = string
  description = "Please provide a name"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
  }
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "reloue"]
}

variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "AlexO",
    port = [22, 25, 80]
  }
}
