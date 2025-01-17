provider "aws" {
  region = "us-east-1"
}

variable "ami_value" {
    description = "value"
}

variable "instance_type_value" {
    description = "value"
    type = map(string)

    default = {
      "dev" = "t2.micro"
      "stage" = "t2.micro"
      "prod" = "t2.micro"
    }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = var.ami_value
  instance_type_value = lookup(var.instance_type_value, terraform.workspace, "t2.micro")
}