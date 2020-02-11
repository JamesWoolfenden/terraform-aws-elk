variable "common_tags" {
  type        = map
  description = "A set of tags"
}

variable "key_name" {
  type        = string
  description = "The namne of the ssh key"
}

variable "subnet_type" {
  type        = string
  description = "A string tag to identity the subnet to use"
}

variable "vpc_cidr" {
  type        = string
  description = "Tge cidr range to identity the VPC to use"
}

variable "instance_type" {
  type        = string
  description = "The AWS instance size for the ELK server"
}

variable "ami_name" {
  type        = string
  description = "Partial string to match the target AMI"
}
