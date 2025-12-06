variable "vpc_name" {
  type = string
  description = "Enter ur vpc name"
  default = "dop10-default-vpc-name"
}

variable "vpc_cidr" {
  type = string
  description = "Enter ur vpc cidr"
  default = "10.0.0.0/16"
}

variable "vpc_azs" {
  type = list(string)
  description = "Enter ur VPC list of azs"
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "private_sn" {
  type = list(string)
  description = "Enter ur VPC private subnets"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_sn" {
  type = list(string)
  description = "Enter ur VPC public subnets"
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "is_enable_nat" {
  type = bool
  description = "Do u want enable NAT Gateway?"
  default = false
}

variable "environment_code" {
  type = string
  description = "Enter ur env code"
  default = "dev"
}

# ! using for dynamic naming AWS resources
variable "my_code" {
  type = string
  description = "Owner"
  default = "dop10"
}

variable "region_code" {
  type = string
  description = "Region that will be host AWS resources"
  default = "an2"

  # validation {
  #   condition     = contains([
  #     "ap-northeast-1", "ap-northeast-2", "ap-northeast-3",
  #   ], var.region_code)
  #   error_message = "Invalid AWS region code. Please provide a valid AWS region."
  # }

  # regex
}