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

resource "aws_key_pair" "webserver" {
  key_name   = local.webserver_keypair_name
  public_key = var.webserver_public_key
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.webserver.id
  instance_type = var.webserver_instance_type
  key_name      = aws_key_pair.webserver.key_name

  network_interface {
    network_interface_id = aws_network_interface.core_public_webserver.id
    device_index         = 0
  }

  tags = {
    Name = local.webserver_instance_name
  }

  depends_on = [aws_internet_gateway.core_stack]
}
