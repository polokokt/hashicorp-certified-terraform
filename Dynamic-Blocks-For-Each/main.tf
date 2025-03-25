variable "sg_ports" {
    type = list(number)
    description = "list of ingress ports"
    default = [8200, 8201, 9200, 9500]
}

resource "aws_security_group" "demo_sg" {
    name = "sample-sg"
    description = "Ingress for vault"

    dynamic "ingress" {
        for_each = var.sg_ports
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

# extended declaration of resource. Add iterator = port fo better readibility
# resource "aws_security_group" "demo_sg" {
#     name = "sample-sg"
#     description = "Ingress for vault"
#
#     dynamic "ingress" {
#         for_each = var.sg_ports
#         iterator = port                     # declaration of iterator
#         content {
#             from_port = port.value          # use iterator for better readibility
#             to_port = port.value            # use iterator for better readibility
#             protocol = "tcp"
#             cidr_blocks = ["0.0.0.0/0"]
#         }
#     }
# }