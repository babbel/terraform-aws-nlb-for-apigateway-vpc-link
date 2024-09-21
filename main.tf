# Subnets

module "subnets" {
  source   = "./subnet"
  for_each = var.cidr_blocks

  name = var.name

  vpc               = var.vpc
  availability_zone = each.key
  cidr_block        = each.value

  route_table_tags = var.route_table_tags
  subnet_tags      = var.subnet_tags

  default_tags = var.default_tags
}

# NLB

resource "aws_lb" "this" {
  name = var.name

  load_balancer_type = "network"

  internal = true
  subnets  = values(module.subnets)[*].this.id

  tags = merge(var.default_tags, var.lb_tags)
}

# API Gateway VPC Link

resource "aws_api_gateway_vpc_link" "this" {
  name        = var.name
  target_arns = [aws_lb.this.arn]

  tags = merge(var.default_tags, var.api_gateway_vpc_link_tags)
}
