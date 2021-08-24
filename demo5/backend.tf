terraform {
  backend "s3" {
      bucket = "terraform-dhanush"
      key = "terraform/statefile"
  }
}