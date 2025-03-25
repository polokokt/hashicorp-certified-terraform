/*
Rules:
- don't use hardcoded values. Use variables if it is possible. Rember about the declaration of variables in variable.tf file
- defining the module, it is important to use 'standard module structure' (structure of files and directories recommended by Hashicorp). 
  In this module, I used all files from minimal module structure
*/

resource "aws_instance" "my-ec2" {
    ami = var.ami
    instance_type = var.instance_type
}