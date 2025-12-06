terraform {
  backend "s3" {
    bucket = "dop10-tf-state-an2-lenv-01"
    key = "DOP10/dev-tfstate"
    region = "ap-northeast-2"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}