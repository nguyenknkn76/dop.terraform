data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  instances = {
    "public-instance" = {
      subnet_id = module.vpc.public_subnets[0]
      subnet_name = "${var.my_dop_id}-${var.project_alias}-public-sn-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
      sg_id = module.public_sg.security_group_id
    }
    "private-instance" = {
      subnet_id = module.vpc.private_subnets[0]
      subnet_name = "${var.my_dop_id}-${var.project_alias}-private-sn-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
      sg_id = module.private_sg.security_group_id
    },
    "db-instance" = {
      subnet_id = module.vpc.database_subnets[0]
      subnet_name = "${var.my_dop_id}-${var.project_alias}-database-sn-${var.region_alias}-${var.env_alias}-${random_string.random_suffix.result}"
      sg_id = module.private_sg.security_group_id
    }
  }

  # string_is_public = each.key == "public-instance" ? "public" : "private"
}

module "ec2_instances" {
  source = "terraform-aws-modules/ec2-instance/aws"
  # version = "value"
  for_each = local.instances
  
  name = each.value.subnet_name
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"
  subnet_id = each.value.subnet_id
  associate_public_ip_address = (each.key == "public-instance")

  vpc_security_group_ids = [each.value.sg_id]

  key_name = module.key_pair.key_pair_name

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "instance_detail" {
  description = "Details of the created EC2 instances"
  value = {
    for key, instance in module.ec2_instances : key => {
      id = instance.id
      public_ip = instance.public_ip
      private_ip = instance.private_ip
    }
  }
}