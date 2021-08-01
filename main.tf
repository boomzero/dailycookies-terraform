provider "aws" {
  region = var.region
}

locals {
  # naming convention: ec2-${region}-${short_env}-${app_code}
  webserver_instance_name = "ec2-${var.region}-${substr(var.env,0,1)}-webserver"
}

data "aws_ami" "webserver" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.webserver.id
  instance_type = var.webserver_instance_type

  tags = {
    Name = local.webserver_instance_name
  }
}