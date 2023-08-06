# main.tf

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "nwanne-bucket"  # Change this to a unique bucket name you want to use

  # Uncomment the following block if you want to enable server-side encryption with AWS managed keys
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
