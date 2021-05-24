resource "aws_security_group" "elk" {
  name        = "elk-server"
  description = "All all Elasticsearch traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    description = "elasticsearch"
    # tfsec:ignore:AWS008
    cidr_blocks = var.ingress_cidrs
  }

  ingress {
    from_port   = 5043
    to_port     = 5044
    protocol    = "tcp"
    description = "logstash"
    # tfsec:ignore:AWS008
    cidr_blocks = var.ingress_cidrs
  }

  ingress {
    from_port       = 5601
    to_port         = 5601
    protocol        = "tcp"
    description     = "kibana"
    security_groups = [aws_security_group.lb.id]
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

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
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
