resource "aws_vpc" "core_vpc" {
  cidr_block = var.core_vpc_cidr

  tags = {
    Name = local.core_vpc_name
  }

}

resource "aws_internet_gateway" "core_stack" {
  vpc_id = aws_vpc.core_vpc.id

  tags = {
    Name = local.internet_gateway_vpc_name
  }
}

resource "aws_subnet" "core_public" {
  vpc_id                  = aws_vpc.core_vpc.id
  cidr_block              = var.core_public_subnet_cidr
  map_public_ip_on_launch = var.core_map_public_ip_on_launch

  tags = {
    Name = local.core_public_subnet_name
  }
}

resource "aws_network_interface" "core_public_webserver" {
  subnet_id = aws_subnet.core_public.id

  tags = {
    Name = local.webserver_core_public_network_interface_name
  }
}