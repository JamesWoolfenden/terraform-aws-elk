resource "aws_security_group" "elk" {
  name        = "elk"
  description = "All all Elasticsearch traffic"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "elasticsearch"
    cidr_blocks = var.ingress_cidrs
  }

  ingress {
    from_port   = 5043
    to_port     = 5044
    protocol    = "tcp"
    description = "logstash"
    cidr_blocks = var.ingress_cidrs
  }

  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    description = "kibana"
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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
