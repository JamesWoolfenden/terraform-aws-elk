common_tags = {
  environment = "dev"
}

instance_type      = "t2.large"
ami_name           = "elk-1-*"
private_subnet_tag = "private"
public_subnet_tag  = "public"
vpc_cidr           = "10.22.0.0/16"
