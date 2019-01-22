data "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
}
