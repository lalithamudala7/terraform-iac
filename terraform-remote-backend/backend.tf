terraform {
  backend "s3" {
    bucket = "lalith-s3-demo-xyz"
    key    = "lalith/terraform.tfstate"
    region = "us-east-1"
    /*dynamodb_table = "terraform_lock"*/
  }
}