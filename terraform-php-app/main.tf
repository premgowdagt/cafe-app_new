# Define AWS provider
provider "aws" {
  region = var.region
}

# Create an EC2 instance
resource "aws_instance" "php_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (Replace based on region)
  instance_type = "t2.micro"
  key_name      = var.key_name

  # Use a startup script to configure the server
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd php git
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              git clone https://github.com/your-username/php-aap1.git .
              EOF

  tags = {
    Name = "PHPAppServer"
  }
}

# Allow HTTP access
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Associate security group with instance
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.allow_http.id
  network_interface_id = aws_instance.php_server.primary_network_interface_id
}
