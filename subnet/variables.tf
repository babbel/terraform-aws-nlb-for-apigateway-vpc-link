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
  type = map(string)

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

variable "vpc" {
  type = object({
    id = string
  })

  description = <<EOS
VPC where the subnet will be created.
EOS
}
