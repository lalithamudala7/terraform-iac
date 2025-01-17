provider "aws" {
    region = "us-east-1" # My Region
}

resource "aws_instance" "this" {
  ami                     = "ami-053b0d53c279acc90"
  instance_type           = "t2.micro"
  subnet_id = "subnet-0e5c2f12b326dc2cf"
  key_name = "awslogin"
}