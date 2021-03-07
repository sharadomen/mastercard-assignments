data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instancetype
  key_name      = aws_key_pair.envkey.key_name

  # the VPC subnet
  subnet_id = element(var.PRIVATE_SUBNETS, 0)

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  tags = {
    Name         = "instance-${var.ENV}"
    Environmnent = "${var.ENV}"
  }
}