variable "common_tags" {
  type        = map(any)
  description = "A set of tags"
}

variable "private_subnet_tag" {
  type        = string
  description = "A string tag to identity the provate sub-net to use"
}

variable "public_subnet_tag" {
  type        = string
  description = "A string tag to identity the public sub-net to use"
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
