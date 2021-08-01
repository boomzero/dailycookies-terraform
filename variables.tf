variable "env" {
  description = "environment name of provisioning resources"
}

variable "region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "webserver_instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.micro"
}
