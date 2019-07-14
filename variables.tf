variable "common_tags" {
  type        = map
  description = "A set of tags"
}

variable "key_name" {
  description = "The namne of the ssh key"
  type        = string
}

variable "subnet_type" {
  description = "A string tag to identity the subnet to use"
  type        = string
}

variable "vpc_cidr" {
  description = "Tge cidr range to identity the VPC to use"
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
  type=list(string)
  description = ""
}

variable "ingress_cidrs" {
  type=list(string)
}
