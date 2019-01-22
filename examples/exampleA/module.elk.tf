module "elk" {
  source        = "../../"
  ami_name      = "${var.ami_name}"
  instance_type = "${var.instance_type}"
  common_tags   = "${var.common_tags}"
  key_name      = "${var.key_name}"
  subnet_type   = "${var.subnet_type}"
  vpc_cidr      = "${var.vpc_cidr}"
}
