variable "common_tags" {
  type        = "map"
  description = "A set of tags"
}

variable "key_name" {
  description = "The namne of the ssh key"
}

variable "subnet_type" {
  description = "A string tag to identity the subnet to use"
}

variable "vpc_cidr" {
  description = "Tge cidr range to identity the VPC to use"
}

variable "instance_type" {
  description = "The AWS instance size for the ELK server"
}

variable "region" {
  description = "AWS Region"
}

variable "ami_name" {
  description = "Partial string to match the target AMI"
}
