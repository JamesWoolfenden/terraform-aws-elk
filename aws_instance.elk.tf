resource "aws_instance" "elk" {
  ami                         = data.aws_ami.redhat.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet_ids.subnets.ids[0]
  associate_public_ip_address = "true"
  user_data                   = file("${path.module}/config/userdata")

  vpc_security_group_ids = [
    aws_security_group.elk.id,
  ]

  tags = merge(var.common_tags,
  map("Name", "${upper(substr(var.common_tags["environment"], 0, 1))}-ELK-EC2"))

  depends_on = ["aws_security_group.elk"]
}
