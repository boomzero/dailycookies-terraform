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

  network_interface {
    network_interface_id = aws_network_interface.core_public_webserver.id
    device_index         = 0
  }

  tags = {
    Name = local.webserver_instance_name
  }

}
