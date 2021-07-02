provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

module "ec2_web_module" {
  source = "./ec2"
  ec2_name = "web_server"
}

module "ec2_db_module" {
  source = "./ec2"
  ec2_name = "db_server"
}

module "eipmodule" {
  source = "./eip"
  ec2_id = module.ec2_web_module.instance_id
}

output "web_module_output" {
  value = module.ec2_web_module.instance_id
}

output "db_module_output" {
  value = module.ec2_db_module.instance_id
}

output "eip_module_output" {
  value = module.eipmodule.public_ip
}
