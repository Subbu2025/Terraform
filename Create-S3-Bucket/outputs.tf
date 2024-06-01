#To get the S3-Bucket-ID as output
output "S3-Bucket-name" {
  description="Name of the s3 bucket"
  value = aws_s3_bucket.my-site.id
}
