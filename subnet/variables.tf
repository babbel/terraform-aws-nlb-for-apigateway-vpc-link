variable "availability_zone" {
  type = string

  description = <<EOS
Availability zone of the subnet.
EOS
}

variable "cidr_block" {
  type = string

  description = <<EOS
Subnet CIDR.
EOS
}

variable "default_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to all AWS resources created by this module.
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
Map of tags assigned to the route table created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}

variable "subnet_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to the subnet created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}

variable "vpc" {
  type = object({
    id = string
  })

  description = <<EOS
VPC where the subnet will be created.
EOS
}
