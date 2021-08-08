/* -------------------------------------------------------------------------- */
/*                               # VPC / subnet                               */
/* -------------------------------------------------------------------------- */
resource "aws_vpc" "core" {
  cidr_block = var.core_vpc_cidr

  tags = {
    Name = local.core_vpc_name
  }

}

resource "aws_internet_gateway" "core_stack" {
  vpc_id = aws_vpc.core.id

  tags = {
    Name = local.internet_gateway_vpc_name
  }
}

resource "aws_subnet" "core_public" {
  vpc_id                  = aws_vpc.core.id
  cidr_block              = var.core_public_subnet_cidr
  map_public_ip_on_launch = var.core_map_public_ip_on_launch

  tags = {
    Name = local.core_public_subnet_name
  }
}

/* -------------------------------------------------------------------------- */
/*                             Network interfaces                             */
/* -------------------------------------------------------------------------- */
resource "aws_network_interface" "core_public_webserver" {
  subnet_id = aws_subnet.core_public.id

  tags = {
    Name = local.webserver_core_public_network_interface_name
  }
}

/* -------------------------------------------------------------------------- */
/*                                   Routing                                  */
/* -------------------------------------------------------------------------- */
locals {
  # workaround for tf plan validation error
  core_stack_igw_id = aws_internet_gateway.core_stack.id
}

resource "aws_route_table" "core_public" {
  vpc_id = aws_vpc.core.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = local.core_stack_igw_id
    }
  ]

  tags = {
    Name = local.core_public_rtb_name
  }

  depends_on = [aws_internet_gateway.core_stack]
}

resource "aws_route_table_association" "core_public" {
  subnet_id      = aws_subnet.core_public.id
  route_table_id = aws_route_table.core_public.id
}

/* -------------------------------------------------------------------------- */
/*                               Network Access                               */
/* -------------------------------------------------------------------------- */
module "core_stack_webserver_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = local.core_stack_webserver_security_group_name
  description = "Allow HTTP/HTTPS, SSH access to webserver from internet"
  vpc_id      = aws_vpc.core.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp", "ssh-tcp"]

  depends_on = [aws_vpc.core]
}