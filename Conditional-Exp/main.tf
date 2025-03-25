provider "aws" {
  region = "eu-west-1"
}

variable "environment" {
    type = string
    default = "development"
}

variable "region" {
    type = string
    default = "eu-central-1"
}

resource "aws_instance" "myec1" {
    ami = "ami-08f9a9c699d2ab3f0"
    instance_type = var.environment == "development" ? "t2.micro" : "m5.large"    # value depends of the variable value. If true, it is setup as "micro", otherwise "large"
    #instance_type = var.environment == "development" && var.region == "eu=central-1" ? "t2.micro" : "m5.large"   ## more complicated example
}