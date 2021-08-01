resource "aws_vpc" "core_vpc" {
  cidr_block = var.core_vpc_cidr

  tags = {
    Name = local.core_vpc_name
  }

  # tags = merge(
  #   {
  #     "name" = format("%s", var.name)
  #   },
  #   var.tags,
  #   var.vpc_tags,
  # )
}

resource "aws_subnet" "core_public" {
  vpc_id                  = aws_vpc.core_vpc.id
  cidr_block              = var.core_public_subnet_cidr
  map_public_ip_on_launch = var.core_map_public_ip_on_launch

  tags = {
    Name = local.core_public_subnet_name
  }
}