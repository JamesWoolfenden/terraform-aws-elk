data "aws_vpcs" "vpc" {
  tags = {
    Name = "TEST"
  }
}

data "aws_vpc" "vpc" {
  id = tolist(data.aws_vpcs.vpc.ids)[0]
}
