# main.tf

provider "aws" {
  region = "eu-west-2" # Replace this with your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "nwanne" # Replace this with your desired bucket name
  acl    = "private" # You can change the ACL (Access Control List) as per your requirements
}
