variable "availability_zone" {
  description = "Availability zone of the subnet"

  type = string
}

variable "cidr_block" {
  description = "Subnet CIDR"

  type = string
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
  description = "VPC where the subnet will be created"

  type = object({
    id = string
  })
}
