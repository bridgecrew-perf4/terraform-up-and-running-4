provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "dz-tf-my-bucket" {
  bucket = "dz-tf-my-bucket"
  acl    = "private"
  tags = {
    Name        = "dz-tf-my-bucket"
    Environment = "dev"
  }

}

resource "aws_s3_bucket_object" "object1" {
  for_each = fileset("myfiles/", "*")
  bucket   = aws_s3_bucket.dz-tf-my-bucket.id
  key      = each.value
  source   = "myfiles/${each.value}"
  etag     = filemd5("myfiles/${each.value}")
}

resource "aws_instance" ""