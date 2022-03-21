resource "aws_launch_configuration" "elk" {
  name_prefix                 = "elk"
  image_id                    = data.aws_ami.elk.image_id
  iam_instance_profile        = aws_iam_instance_profile.elk.name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.elk.id]
  associate_public_ip_address = false

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    encrypted = var.encrypted
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}
