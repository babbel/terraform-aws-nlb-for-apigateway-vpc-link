variable "api_gateway_vpc_link_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to the API Gateway VPC Link created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}

variable "cidr_blocks" {
  type = map(string)

  description = <<EOS
Map of subnet CIDRs by availability zone used by the NLB.
EOS
}

variable "default_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to all AWS resources created by this module.
EOS
}

variable "lb_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to the NLB created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}

variable "name" {
  type = string

  description = <<EOS
Name of the NLB.
EOS
}

variable "route_table_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to the route tables created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}

variable "subnet_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to the subnets created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}

variable "vpc" {
  type = object({
    id = string
  })

  description = <<EOS
VPC where the NLB and the subnets will be created.
EOS
}
