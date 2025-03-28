resource "aws_eip" "eip" {
  address                   = try(var.address, null)
  associate_with_private_ip = try(var.associate_with_private_ip, null)
  customer_owned_ipv4_pool  = try(var.customer_owned_ipv4_pool, null)
  domain                    = try(var.domain, null)
  instance                  = try(var.instance, null)
  network_border_group      = try(var.network_border_group, null)
  network_interface         = try(var.network_interface, null)
  public_ipv4_pool          = try(var.public_ipv4_pool, null)
  tags                      = try(var.tags, {})
}