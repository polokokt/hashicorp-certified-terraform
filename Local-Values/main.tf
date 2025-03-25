provider "aws" {
  region = "eu-west-1"
}

variable "tags" {
    type = map 
    default = {
        Team = "security-team"   
    }
}

locals {                                                # declaration with "s" at the end so "locals"
    common_tags = {
        Team = "security-team"
        CreationDate = "date-${formatdate("DDMMYY", timestamp())}"    ## Locals allow the use of functions in their definitions
    }
}

resource "aws_security_group" "sg_01" {
  name        = "app-firewall"

  tags = var.tags                           # we used typical value from variable
}

resource "aws_security_group" "sg_02" {
  name        = "db-firewall"

  tags = local.common_tags                 # here we used value from locals, where we also have function defined
}                                          # call the value as "local" not "locals" !!!                     
