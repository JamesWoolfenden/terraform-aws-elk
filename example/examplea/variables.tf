variable "common_tags" {
  type        = map
  description = "A set of tags"
}

variable "subnet_tag" {
  type        = string
  description = "A string tag to identity the sub-net to use"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR to identity the VPC to use"
}

variable "instance_type" {
  type        = string
  description = "The AWS instance size for the ELK server"
}

variable "ami_name" {
  type        = string
  description = "Partial string to match the target AMI"
}
