terraform {
  backend "s3" {
    bucket = "bucket-for-terraform-ci/cd"
    key    = "state"
    region = "ap-south-1"
    dynamodb_table = "backened"
  }
}
