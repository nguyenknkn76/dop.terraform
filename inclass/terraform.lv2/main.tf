module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  # default version: latest

  # name = var.vpc_name #"my-vpc"
  name = "${var.my_code}-vpc-${var.region_code}-${var.environment_code}-01"
  cidr = var.vpc_cidr #"10.0.0.0/16"

  azs             = var.vpc_azs #["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  private_subnets = var.private_sn #["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = var.public_sn #["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = var.is_enable_nat #true
  # enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.environment_code #"dev"
  }
}

# https://registry.terraform.io/namespaces/terraform-aws-modules