output "instance_ip" {
  value = aws_instance.php_server.public_ip
  description = "Public IP of the PHP server"
}
