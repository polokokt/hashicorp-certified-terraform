# to add more, same providers in different regions, there is a need to add alias to the provider configuration 

provider "aws" {             # default provider
    region = "eu-central-1"
}

provider "aws" {             # additional provider with alias
    alias = "mumbai"
    region = "ap-south-1"
}

provider "aws" {             # additional provider with alias
    alias = "usa"
    region = "us_east-1"
}

resource "aws_security_group" "sg_1" {
    provider = aws.mumbai                   # assign resource to the provider
    name = "prod_firewall"
}

resource "aws_security_group" "sg_2" {
    provider = aws.usa                      # assign resource to the provider
    name = "stage_firewall" 
}