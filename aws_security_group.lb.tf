resource "aws_security_group" "lb" {
  name        = "elk-lb"
  description = "for the lb"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "kibana"
    # tfsec:ignore:AWS008
    cidr_blocks = var.ingress_cidrs
  }


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "kibana"
    # tfsec:ignore:AWS008
    cidr_blocks = var.ingress_cidrs
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = var.ssh_cidrs
  }

  # outbound
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }
}
