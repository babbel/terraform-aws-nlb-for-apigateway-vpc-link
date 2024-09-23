variable "cidr_blocks" {
  type = map(string)

  description = <<EOS
Map of subnet CIDRs by availability zone used by the NLB.
EOS
}

variable "name" {
  type = string

  description = <<EOS
Name of the NLB.
EOS
}

variable "tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to all AWS resources created by this module.
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
