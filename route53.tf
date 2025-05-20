resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

output "nameservers" {
  value = aws_route53_zone.primary.name_servers
}
