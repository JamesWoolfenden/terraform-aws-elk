resource "aws_instance" "elk" {
  ami           = data.aws_ami.redhat.id
  instance_type = var.instance_type

  subnet_id                   = element(data.aws_subnet_ids.subnets.ids, 0)
  associate_public_ip_address = "true"
  user_data                   = file("${path.module}/config/userdata")

  vpc_security_group_ids = [
    aws_security_group.elk.id,
  ]

  tags = var.common_tags
}
