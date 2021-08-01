variable "region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "webserver_instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.micro"
}

variable "webserver_instance_name" {
  description = "Dailycookies web"
  default     = "dailycookies-web"
}
