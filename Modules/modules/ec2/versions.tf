# in the module I have hardcoded version of provider. This is recomended configuration

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.92.0"
    }
  }
}