module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  
  key_name = "${var.my_dop_id}-${var.project_alias}-kp-${var.region_alias}-${var.env_alias}"

  public_key = file("~/.ssh/tf_aws_key.pub")
}