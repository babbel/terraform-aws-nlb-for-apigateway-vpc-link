# Network Load Balancer (NLB) with API Gateway VPC Link

This module creates a private NLB and VPC link connected to the NLB which can be used in REST API Gateways.

This module will also create dedicated subnets. Those allow restricting access to the NLB by CIDR.

Optionally, security groups can be assigned to the NLB via `security_group_ids`. They have to be set when the NLB is created: adding them to an existing NLB without security groups replaces the NLB and the VPC link. As the VPC link reaches the NLB via PrivateLink, the inbound rules of the security groups are not enforced for that traffic by default (see `enforce_security_group_inbound_rules_on_private_link_traffic`). Make sure the security groups allow outbound traffic to the targets.

## Example Usage

```tf
module "nlb" {
  source  = "babbel/nlb-for-apigateway-vpc-link/aws"
  version = "~> 2.2"

  name = "example"

  vpc = aws_vpc.this

  cidr_blocks = {
    eu-west-1a = cidrsubnet(aws_vpc.this, 8, 0)
    eu-west-1b = cidrsubnet(aws_vpc.this, 8, 1)
  }
}
```

## Example Usage with Security Groups

```tf
resource "aws_security_group" "nlb" {
  name   = "example-nlb"
  vpc_id = aws_vpc.this.id
}

module "nlb" {
  source  = "babbel/nlb-for-apigateway-vpc-link/aws"
  version = "~> 2.2"

  name = "example"

  vpc = aws_vpc.this

  cidr_blocks = {
    eu-west-1a = cidrsubnet(aws_vpc.this, 8, 0)
    eu-west-1b = cidrsubnet(aws_vpc.this, 8, 1)
  }

  security_group_ids = [aws_security_group.nlb.id]
}
```
