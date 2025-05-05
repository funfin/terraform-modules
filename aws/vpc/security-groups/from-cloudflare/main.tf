data "http" "ipv4" {
  url = "https://www.cloudflare.com/ips-v4"
}

data "http" "ipv6" {
  url = "https://www.cloudflare.com/ips-v6"
}

locals {
  name = var.name != "" ? var.name : "from-cloudflare-sg"
}

resource "aws_security_group" "this" {
  name        = local.name
  description = "${local.name} - allow inbound tcp traffic from Cloudflare IPs"
  vpc_id      = var.vpc_id

  tags = {
    Name = local.name
  }
}

resource "aws_security_group_rule" "this" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = split("\n", data.http.ipv4.response_body)
  ipv6_cidr_blocks  = split("\n", data.http.ipv6.response_body)
  security_group_id = aws_security_group.this.id
}