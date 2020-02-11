module "elk" {
  source        = "../../"
  ami_name      = var.ami_name
  ingress_cidrs = ["0.0.0.0/0"]
  ssh_cidrs     = ["0.0.0.0/0"]
  instance_type = var.instance_type
  common_tags   = var.common_tags
  subnet_tag    = var.subnet_tag
  vpc_cidr      = var.vpc_cidr
}
