variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "ap-northeast-2"
}

variable "aws_azs" {
  description = "The availability zones to use for the subnets."
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2d"]
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "database_subnet_cidr_block" {
  description = "The CIDR block for the database subnet."
  type        = string
  default     = "10.0.3.0/24"
}

variable "instance_type" {
  description = "The type of EC2 instances to launch."
  type        = string
  default     = "t3.micro"
}