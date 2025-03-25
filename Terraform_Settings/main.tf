terraform {
    required_version = "1.11.1"    # defined manually exact version of the terraform version
    required_providers {
        aws = {
            version = "5.91.0"
            source = "hashicorp/aws"  # fixede exact version of the aws provider
        }
    }
}

resource "aws_security_group" "sg_01" {
    name = "app_firewall"
}