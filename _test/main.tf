provider "aws" {
  region = "local"
}

module "nlb" {
  source = "./.."

  name = "example"

  vpc = { id = "vpc-01234567" }

  cidr_blocks = {
    local-a = "10.0.0.0/24"
    local-b = "10.0.1.0/24"
  }

  default_tags = {
    app = "example"
    env = "production"
  }
}

module "nlb-with-security-groups" {
  source = "./.."

  name = "example-with-security-groups"

  vpc = { id = "vpc-01234567" }

  cidr_blocks = {
    local-a = "10.0.2.0/24"
    local-b = "10.0.3.0/24"
  }

  security_group_ids = ["sg-01234567"]
}
