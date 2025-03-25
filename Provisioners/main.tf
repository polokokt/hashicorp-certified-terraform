/*
There are three types of provisioners:

local-exec

remote-exec

file
*/

# example:

resource "aws_instance" "lb" {
    ami = "ami-123"
    instance_type = "t2.micro"
    key_name = "terraform-key"   # name of the key pair created via AWS -> EC2 -> "Key pair" console. Need by remote-exec to connect with EC2 after creation
    vpc_security_group_ids = ["sg-12345"]   # connect security group witch allow to connect to the seerver via ssh after creation

# Section for local-exec

    provisioner "local-exec" {
        command = "echo Server IP: ${slef.public_ip}, has beed created thorugh Terraform"
    }

    # provisioner "local-exec" {
    #   command = <<EOT 
        #     echo Server IP: ${slef.public_ip}, has beed created thorugh Terraform
        #     echo ${self.public_ip} >> server_ip.txt
        # EOT
    # }

    # provisioner "local-exec" {
    #     when = destroy                          # definition when the provisioner should be run
    #     command = "echo Server is going to deatroy"
    # }

# Section for remote-exec

    connection {                 # configuration block needs for remote-exec provisioner
        type = "ssh"
        user = "ec2-user"
        private_key = file("./terraform-key.pem")  # key created via AWS -> EC2 -> "Key pair" console
        host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install -y nginx",
            "sudo systemctl start nginx"
        ]
    }

}


#######################  
# when provisioner will fail, whole resource will be marked as tainted (polish: skażony). And during nex terraform apply, this resource will be recreated.check "" 
# But there is also param: on_failure = continue / fail
# we can setup the behevior what to do, and if mark the resource as tainted after provisioner failure. 