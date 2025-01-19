terraform {
  backend "s3" {
    bucket = "week6-kng-terraform-bucket"
    key    = "week7-project-vpc/terraform.tfstate"
    region = "eu-west-3"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}