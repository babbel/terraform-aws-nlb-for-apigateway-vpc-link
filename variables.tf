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

variable "enforce_security_group_inbound_rules_on_private_link_traffic" {
  type    = string
  default = "off"

  description = <<EOS
Whether the inbound rules of `var.security_group_ids` apply to PrivateLink traffic, i.e. to traffic from the API Gateway VPC Link. Either `on` or `off`. Only used if `var.security_group_ids` is set.
EOS

  validation {
    condition     = contains(["on", "off"], var.enforce_security_group_inbound_rules_on_private_link_traffic)
    error_message = "The value must be either \"on\" or \"off\"."
  }
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

variable "security_group_ids" {
  type    = list(string)
  default = null

  description = <<EOS
List of security group IDs assigned to the NLB. If `null`, the NLB is created without security groups.

Security groups can only be added to an NLB which has been created with at least one security group. Changing this from `null` to a list (or back) replaces the NLB and therefore the API Gateway VPC Link.
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
