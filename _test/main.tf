provider "aws" {
  region = "local"
}

module "nlb" {
  source  = "./.."

  name = "example"

  vpc = { id = "vpc-01234567" }

  cidr_blocks = {
    local-a = "10.0.0.0/24"
    local-b = "10.0.1.0/24"
  }

  tags = {
    app = "example"
    env = "production"
  }
}
