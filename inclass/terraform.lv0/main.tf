provider "aws" {
  region = "ap-northeast-2" # ap-northeast-2
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

# dynamic data CAN be get from AWS (cloud provider)
# data.<type_of_resource>.<name_of_resource>.<attribute>

# define argument ref of ec2 instances
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#aws-configuration-reference

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id # ex: ami-0a71e3eb8b23101ed
  instance_type = "t2.micro"

  tags = {
    Name = "learn-terraform"
  }
  # region                      = "ap-northeast-2"
  associate_public_ip_address = true
  subnet_id = "subnet-0606212bc4b3dedfe"
}
