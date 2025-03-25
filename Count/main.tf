# Generally "count" is perfect to create many the same resources (with exactly the same configuration).check "name"
# If you have to create many resources but with smal difference in the configuration between them. Forr example, you have to create Users with different mnames, according to the list variable,
# there is better to use "for_each"

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "myec1" {
    ami = "ami-08f9a9c699d2ab3f9"
    instance_type = "t2.micro"
    count = 3                         # this param will generate this resource 3 times. It also will manage the name of the resource. But all names will be the same in AWS console
}

resource "aws_instance" "myec2" {
    ami = "ami-08f9a9c699d2ab3f9"
    instance_type = "t2.micro"
    count = 2                         # this param will generate this resource 2 times. It also will manage the name of the resource. 
    tags = {
        Name = "payments-system-${count.index}"      # this will add Name tag and index number next to the resource
    }
}

resource "aws_iam_user" "user" {
    name = "developer-user-${count.index}"
    count = 3
}

##################################################
## Add unique names according to the count index

variable "name" {
    type = list
    default = ["Alice", "Damian", "Bruno"]
}

resource "aws_iam_user" "user2" {
    name = var.name[count.index]
    count = 3                  # fixed count number
    #count = length(var.name)  # dynamically set count based on list length
}