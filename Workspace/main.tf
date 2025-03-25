/*
This is sample tf file, where I used configuration, depends on the workspace name. I defined workspace dev and prod (default is as standard).
Depends on what workspace is the operator switched on, the proper value will be use. 
*/

locals {
    instance_type = {
        default = "t2.nano"
        dev = "t2.micro"
        prod = "m5.large"

    }
}

resource "aws_instance" "ec2" {
    ami = "ami-123"
    instance_type = local.instance_type[terraform.workspace]
}