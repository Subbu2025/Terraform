# Define an input variable to pass the AWS Accesskey for authentication
variable "aws_access_key" {
  description = "Access Key for AWS"
  type = string
}
# Define an input variable to pass the AWS Secret key for authentication
variable "aws_secret_key" {
  description = "Secret Key for AWS"
  type = string
}
# Define an input variable for the AWS region
variable "aws_region" {  
    description = "AWS region"  
    type        = string  
    default     = "us-east-1"
    }
