# configuration to show how to use Remote State datasource as input value to our configuration. 
# And use IP addres from the repote state as input, to our Security Group

data "terrafaorm_remote_state" "eip" {    # this part of configution (data) should be in the separated data.tf file
    backend = "s3"
    config = {
        bucket = "terraform-backend"            # s3 bucket name
        key    = "network/eip.tfstate"    # path and file name in the s3 bucket
        region = "eu-central-1"
    }
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = "${data.terrafaorm_remote_state.eip.outputs.eip_addr}/32"   # Defined data to fetch from remote state
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
}