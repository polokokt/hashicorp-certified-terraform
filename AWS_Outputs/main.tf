provider "aws" {
    region = "eu-west-1"
}

resource "aws_eip" "lb" {
    domain = "vpc"
}

output "public-ip" {
    value = aws_eip.lb.public_ip
    # value = "http://${aws_eip.lb.public_ip}:8080"   # alternative customized output
    # value = aws_eip.lb                              # alternative output with all atributes for lb resource
}