resource "random_string" "random_suffix" {
  length = 4
  special = false
  upper = true
  lower = true
  numeric = true
  # override_special = "!@#$%^&*"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.my_dop_id}-${var.project_alias}-vpc-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
  cidr = "10.0.0.0/16"

  azs = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]

  private_subnets = ["10.0.1.0/24"]
  public_subnets = ["10.0.101.0/24"]
  database_subnets = ["10.0.21.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  create_database_subnet_group = false

  tags = {
    Terraform = true
    Environment = var.env_name
  }
}

# `<company/project>-<team>-<app_name>-<service_name>-<region>-<env>-<suffix>`