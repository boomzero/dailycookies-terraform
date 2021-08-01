locals {
  # naming convention: ec2-${region}-${short_env}-${app_code}
  short_env               = substr(var.env, 0, 1)
  core_vpc_name           = "vpc-${var.region}-${local.short_env}-core-stack"
  core_public_subnet_name = "subnet-${var.region}-${local.short_env}-core-stack-public"
  webserver_instance_name = "ec2-${var.region}-${local.short_env}-webserver"
}

