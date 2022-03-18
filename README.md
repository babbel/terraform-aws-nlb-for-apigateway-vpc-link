# Network Load Balancer (NLB) with API Gateway VPC Link

This module creates a private NLB and VPC link connected to the NLB which can be used in REST API Gateways.

This module will also create dedicated subnets. Those are necessary for restricting access as NLBs as they do not support VPC security groups.

## Example Usage

```tf
module "nlb" {
  source  = "babbel/nlb-for-apigateway-vpc-link/aws"
  version = "~> 1.1"

  name = "example"

  vpc = aws_vpc.this

  cidr_blocks = {
    eu-west-1a = cidrsubnet(aws_vpc.this, 8, 0)
    eu-west-1b = cidrsubnet(aws_vpc.this, 8, 1)
  }

  tags = {
    app = "example"
    env = "production"
  }
}
```
