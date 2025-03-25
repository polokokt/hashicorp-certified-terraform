# For the below, the first module, I added (like it is recommended) variables in the module, so below are assigned values to the expected inputs, which are declared in the modulecheck "name" 

provider "aws" {  # I defined provider here, with information about the region. In the module there is hardcoded version of the provider
    region = "eu-central-1"
}

module "ec2" {  # calling module from local repo
    source = "../../modules/ec2"
    ami = "ami-123"
    instance_type = "t2.micro"
}

resource "aws_eip" "this" {   ## sample resource where I attached output value from the above ec2 module
    domain = "vpc"
    instance = module.ec2.instance_id
}

######################################################################
# The Second sample. Calling the module from github repo
module "consul" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  version = "5.7.1"
}