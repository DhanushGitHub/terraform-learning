resource "aws_instance" "dkr-example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  #VPC Subnet
  subnet_id = aws_subnet.main-public-1.id

  #Security Group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  #Public SSH Key
  key_name = aws_key_pair.mykeypair_dkr.key_name
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = " Extra Volume Data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachement" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.dkr-example.id
}