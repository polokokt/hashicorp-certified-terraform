resource "aws_security_group" "payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.lb]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    description = "ingress allows HTTPS  from DEV VPC"
    from_port   = var.default_https_port
    to_port     = var.default_https_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    description = "ingress allows APIs access from DEV VPC"
    from_port   = var.app_http_port
    to_port     = var.app_http_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    description = "ingress allows APIs access from Prod App Public IP"
    from_port   = var.app_https_port
    to_port     = var.app_https_port
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   tags = {
    Name = "payment_app"
    Team = "Payments Team"
    Environment = var.environment
   }
}


resource "aws_eip" "lb" {
  domain = "vpc"
  tags = {
    Name = "payment_app"
    Team = "Payments Team"
    Environment = var.environment
  }
}