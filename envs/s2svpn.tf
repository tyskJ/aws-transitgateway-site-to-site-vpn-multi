/************************************************************
Customer Gateway
************************************************************/
resource "aws_customer_gateway" "this" {
  for_each = local.cgws

  bgp_asn     = each.value.asn
  ip_address  = aws_eip.this[each.value.eip_key].public_ip
  device_name = each.value.name
  type        = "ipsec.1"
  tags = {
    Name = each.value.name
  }
}