provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-123"
    instance_type = "t2.micro"

    lifecycle {
        ignore_changes = [tags]        # meta agrument which will ignore changes made manually on the AWS console in tags section
    }
}
/*
there are many different allowed metya arguments in aws:
- lifecycle
- depends_on
- count
- for_each
- provider
*/