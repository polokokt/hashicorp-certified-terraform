variable "region" {
    default = "eu-central-1"
}

variable "tags" {
    type = list 
    default = ["first_ec2", "second_ec2"]
}

variable "ami" {
    type = map 
    default = {
        "us-east-1" = "ami-123"
        "eu-central-1" = "ami-345"
        "ap-south-1" = "ami-789"
    }
}

resource "aws_instance" "app-dev" {
    ami = lookup(var.ami, var.region)   ## function lookup from tf build-in functions
    instance_type = "t2.micro"
    count = length(var.tags)            ## function length from tf build-in functions

    tags = {
        Name = element(var.tags, count.index)   ## function element from tf build-in functions
        CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ",timestamp())   #formatdate and timestamp functions from build-in th functions
    }
}