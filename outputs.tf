output "apigateway_vpc_link" {
  description = "The VPC link to be used in REST API Gateways"
  value       = aws_api_gateway_vpc_link.this
}

output "subnets" {
  description = "Subnets used by the NLB"
  value       = values(module.subnets)
}

output "this" {
  description = "NLB"
  value       = aws_lb.this
}
