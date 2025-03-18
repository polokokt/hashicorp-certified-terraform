variable "vpn_ip" {
    default = "201.20.30.50/32"
    description = "This is a VPN Server created in AWS"
}

variable "app_port" {
    default = "8080"
    description = "Application port"
}

variable "ssh_port" {
    default = "22"
}

variable "ftp_port" {
    default = "21"
}