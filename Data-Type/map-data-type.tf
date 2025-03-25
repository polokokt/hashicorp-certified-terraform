variable "my-map" {
    type = map
    default = {
        Name = "Alice"
        Team = "Green"
    }
}

output "variable_value" {
    value = var.my-map
}

###################################################

resource "aws_instance" "web" {
  ami           = "ami-08f9a9c699d2ab3f9"
  #instance_type = var.instance_type_list[2]            ## how to call value from a list
  #instance_type = var.instance_type_map["eu-west-3"]   ## how to call value from a map
}

variable "instance_type_list" {
    type = list
    default = ["m5.large", "m5.xlarge", "t2.micro"]
}

variable "instance_type_map" {
    type = map
    default = {
        eu-west-1 = "m5.large"
        eu-west-2 = "m5.xlarge"
        eu-west-3 = "t2.micro"

    }
}