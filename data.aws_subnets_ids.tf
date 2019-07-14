data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags={
    Name = "*${var.subnet_type}*"
  }
}
