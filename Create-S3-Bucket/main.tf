# To create a S3 Bucket
resource "aws_s3_bucket" "my-site" {
  bucket = "my-tf-test-bucket-web"

  tags = {
    Name        = "my-site-bucket"
    Environment = "Dev"
  }
}
