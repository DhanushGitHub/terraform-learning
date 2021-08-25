module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "dhanush-terraform-bucket"
  acl    = "private"
  versioning = {
    enabled = "true"
  }
}