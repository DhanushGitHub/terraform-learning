resource "aws_key_pair" "mykeypair_dkr" {
  key_name   = "mykeypair_dkr"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}