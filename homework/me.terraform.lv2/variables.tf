variable "my_dop_id" {
  type = string
  description = "Enter DOP ID"
  default = "dop10"
}

variable "region_alias" {
  type = string
  description = "Enter Availble Region Alias"
  default = "an2"
}

variable "project_alias" {
  type = string
  description = "My Project Alias"
  default = "tfd" # terraform demo
}

variable "env_alias" {
  type = string
  description = "Which is environment alias?"
  default = "d" # dev
}

variable "region_name" {
  type = string
  description = "Enter Availble Region Name"
  default = "ap-northeast-2"
}

variable "project_name" {
  type = string
  description = "Project Name"
  default = "terraform-demo" # terraform demo
}

variable "env_name" {
  type = string
  description = "Which is Environment Name?"
  default = "dev" # dev
}

variable "vpc_private_subnets" {
  type = list(string)
  description = "List of VPC Private Subnets"
  default = ["10.0.1.0/24", "10.0.103.0/24"]
}

variable "vpc_public_subnets" {
  type = list(string)
  description = "List of VPC Public Subnets"
  default = ["10.0.101.0/24"]
}

variable "vpc_azs" {
  type = list(string)
  description = "List of VPC AZs"
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "vpc_cidr" {
  type = string
  description = "Enter VPC CIDR"
  default = "10.0.0.0/16"
}

