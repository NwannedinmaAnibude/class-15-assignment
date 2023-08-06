# main.tf

provider "aws" {
  region = "eu-west-2"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "class15-assignment"  # Change this to your desired bucket name
  acl    = "private"                  # Access Control List for the bucket (options: private, public-read, public-read-write, authenticated-read)
}
