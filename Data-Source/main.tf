data "local_file" "foo" {
    filename = "${path.module}/sample-data.txt"
}

output "data"{
    value = data.local_file.foo.content
}

##############################################

data "aws_instances" "foo" {      #data source with filter, to show only resources with proper tag: Team = Production
    filter {
        name = "tag:Team"
        values = ["Production"]
    }
}

##############################################

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "myec2" {
    ami = data.aws_ami.ubuntu.image_id
    instance_type = "t2.micro"
}

data "aws_ami" "ubuntu" {
  owners           = ["amazon"]
  most_recent      = true

  filter {
    name   = "name"
    values = ["buntu-pro-server/images/hvm-ssd/ubuntu-jammy-22.04-amd64-pro-server-*"]
  }
}