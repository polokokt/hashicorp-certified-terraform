resource "aws_instance" "myec2_v1" {   #EC2 created vith variable defined with default value in variables.tf
    ami = var.ami_west
    instance_type = "t2.micro"
}

resource "aws_instance" "myec2_v1" {   #EC2 created vith variable defined in variables.tf and with value from tfvars
    ami = var.ami_west
    instance_type = "t2.micro"
}