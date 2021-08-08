locals {
  # naming convention: ec2-${region}-${short_env}-${app_code}
  short_env = substr(var.env, 0, 1)

  # vpc/subnet/gateway
  core_vpc_name             = "vpc-${var.region}-${local.short_env}-core-stack"
  internet_gateway_vpc_name = "igw-${var.region}-${local.short_env}-core-stack"
  core_public_subnet_name   = "subnet-${var.region}-${local.short_env}-core-stack-public"

  # routing
  core_public_rtb_name = "rtb-${var.region}-${var.short_env}-core-stack-public"

  # network access
  core_stack_webserver_security_group_name = "sg-${var.region}-${var.short_env}-core-stack-webserver"

  # compute
  webserver_core_public_network_interface_name = "interface-${var.region}-${local.short_env}-core-stack-public-webserver"
  webserver_instance_name                      = "ec2-${var.region}-${local.short_env}-webserver"
}

