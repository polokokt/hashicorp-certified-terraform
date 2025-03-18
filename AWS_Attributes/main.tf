provider "aws" {
    region = "eu-west-1"
}

resource "aws_eip" "lb" {
    domain = "vpc"
}

resource "aws_instance" "web" {
    ami = "ami-08f9a9c699d2ab3f9"
    instance_type = "t2.micro"
}

