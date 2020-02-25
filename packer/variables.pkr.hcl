variable "vpc_id" {
  description="The VPC you're building AMIs in"
  type=string
}

variable "region" {
  description="The AWS region you're using"
  type=string
}

variable "subnet_id" {
  description="The Subnet to build the AMI inm that's ssh'able"
  type=string
  default="subnet-05f8f3c120238ca8d"
}
