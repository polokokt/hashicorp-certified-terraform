resource "aws_instance" "myec2" {
    ami = "ami-08f9a9c699d2ab3f9"
    instance_type = "t2.micro"
}