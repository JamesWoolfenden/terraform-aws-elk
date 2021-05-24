

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

variable "encrypted" {
  description = "Root block device encryption"
  type        = bool
  default     = true
}

variable "elb_name" {
  type        = string
  default     = "elk-elb"
  description = "(optional) describe your variable"
}

variable "vpc_id" {
  type = string
}

variable "subnet_public" {
}

variable "subnet_private" {
}
