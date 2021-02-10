variable "cidr_blocks" {
  description = "Map of subnet CIDRs by availability zone used by the NLB"

  type = map(string)
}

variable "name" {
  description = "Name of the NLB"

  type = string
}

variable "tags" {
  description = "Map of tags to assign to all resources supporting tags (in addition to the `Name` tag)"

  type = map(string)
}

variable "vpc" {
  description = "VPC where the NLB and the subnets will be created"

  type = object({
    id = string
  })
}
