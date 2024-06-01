terraform {
  backend "s3" {
    bucket = "tf-statefile-s3-demo-bucket"
    key    = "subbu/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
