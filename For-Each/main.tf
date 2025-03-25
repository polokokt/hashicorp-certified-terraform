# In "set" type , there is not important the order. If you will change the order, nothing will change in the configuration. 
# Duplication in the set, are removed. So if you will have the same name "John" twice, it will be use only once. 

variable "name" {
    type = set(string)      # string needs to define the type of data. 
    default = ["Alice","John","Adam"]
}

# In "list" type , order is very important. If you will change the order, or add something as first on the list (with index = 0), whole structure will be rebuild 
# Duplication in the set, are allowed. So if you will have the same name "John" twice, the resource with the same name will be create twice

variable "user_names" {
    type = list            # list doesn't need the type of data
    default = ["Alice","John","Adam"]
}

resource "aws_iam_user" "lb" {
    for_each = variable.user_names            # when we have to create many similar resources but with different configuration, for_each is better than count
    name = "each.value"

}


########################################################

/*
for_each - gives us two types of attributes when we will use it for map type of variable:

each.key   -   the map key (or set member) corresponding to this instance
each.value - The map value corresponding to this instance 
*/

variable "map" {
    default = {
        dev = "ami-123"
        prod = "ami-345"
    }
}

resource "aws_instance" "web" {
    for_each = variable.map
    ami = each.value           # we are using value from map
    instance_type = "t2.micro"

    tags = {
        Name = each.key        # we are using vkey from map
    }
}