output "webserver_instance_ami" {
  value = aws_instance.webserver.ami
}

output "webserver_instance_arn" {
  value = aws_instance.webserver.arn
}