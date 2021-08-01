variable "env" {
  description = "environment name of provisioning resources"
}

variable "region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "core_vpc_cidr" {
  description = "CIDR of VPC host core app stack"
  default     = "10.0.0.0/16"
}

variable "core_public_subnet_cidr" {
  description = "CIDR of public subnet (Core VPC)"
  default     = "10.1.0.0/16"
}

variable "core_map_public_ip_on_launch" {
  description = "Specify wether to automatically assign pulic IP to resource created in this subnet."
  default     = "true"
}

variable "webserver_instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.micro"
}
