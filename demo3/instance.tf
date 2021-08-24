resource "aws_instance" "dkr_example" {
ami = var.AMIS[var.AWS_REGION]
instance_type = "t2.micro"
}