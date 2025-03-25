provider "aws" {
    region = "eu-central-1"
}

import {
    to = aws_security-group.mysg
    id = "sg-07c146fa67854"    # id of resource created manually
}