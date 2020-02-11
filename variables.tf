variable "common_tags" {
  type        = map
  description = "A set of tags"
}

variable "subnet_tag" {
  description = "A string tag to identity the sub-net to use"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR range to identity the VPC to use"
  type        = string
}

variable "instance_type" {
  description = "The AWS instance size for the ELK server"
  type        = string
}

variable "ami_name" {
  description = "Partial string to match the target AMI"
  type        = string
}

variable "ssh_cidrs" {
  description = "A range that is allowed to ssh on to the ELK stack"
  type        = list(string)
}

variable "ingress_cidrs" {
  description = "A range that is allowed to access ELK stack"
  type        = list(string)
}
