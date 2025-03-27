terraform {
    required_providers {
        digitalocean = {
            source  = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

provider "aws" {
    region = "eu-central-1"
}

resource "aws_eip" "kplabs_app_ip" {
    domain = "vpc"
}