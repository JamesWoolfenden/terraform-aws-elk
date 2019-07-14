common_tags = {
  environment = "dev"
}

instance_type = "t3.micro"
ami_name      = "RHEL-BASE-*"
subnet_type   = "private"
key_name      = "id_rsa.elastic"
vpc_cidr      = "10.0.0.0/16"
region        = "eu-west-1"
