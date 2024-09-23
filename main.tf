# Subnets

module "subnets" {
  source   = "./subnet"
  for_each = var.cidr_blocks

  name = var.name

  vpc               = var.vpc
  availability_zone = each.key
  cidr_block        = each.value

  default_tags = var.default_tags
}

# NLB

resource "aws_lb" "this" {
  name = var.name

  load_balancer_type = "network"

  internal = true
  subnets  = values(module.subnets)[*].this.id

  tags = var.default_tags
}

# API Gateway VPC Link

resource "aws_api_gateway_vpc_link" "this" {
  name        = var.name
  target_arns = [aws_lb.this.arn]

  tags = var.default_tags
}
