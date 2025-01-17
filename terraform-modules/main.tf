provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-0e2c8caa4b6378d8c"
    instance_type_value = "t2.micro"
}