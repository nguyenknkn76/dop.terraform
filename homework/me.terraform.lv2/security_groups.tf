module "public_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "${var.my_dop_id}-${var.project_alias}-public-sg-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
  description = "Allow SSH from public internet"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      description = "SSH from Internet"
      cidr_blocks = "0.0.0.0/0" # WARNING: For production, restrict this to your IP
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "${var.my_dop_id}-${var.project_alias}-public-sg-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
  }
}

module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "${var.my_dop_id}-${var.project_alias}-private-sg-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
  description = "Allow SSH from Public Security Group"
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "SSH from Public Security Group"
      source_security_group_id = module.public_sg.security_group_id
    },

    {
      from_port                = -1
      to_port                  = -1
      protocol                 = "icmp"
      description              = "ICMP (PING) from Public Security Group"
      source_security_group_id = module.public_sg.security_group_id
    },
  ]

    egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "${var.my_dop_id}-${var.project_alias}-private-sg-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
  }
}