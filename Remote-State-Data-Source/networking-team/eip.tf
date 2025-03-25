# Configuration of resources with outputr of IP address , which will be use by security team to add it to the Security Group in their configuration (different TF repo)

resource "aws_eip" "lp" {
    domain = "vpc"
}

output "eip_addr" {
    value = aws_eip.lp.public_ip
}