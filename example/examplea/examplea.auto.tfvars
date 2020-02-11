common_tags = {
  environment = "dev"
}

instance_type = "t2.large"
ami_name      = "elk-1-*"
subnet_tag    = "private"
vpc_cidr      = "10.22.0.0/16"
