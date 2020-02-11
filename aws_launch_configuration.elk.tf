resource "aws_launch_configuration" "elk" {
  image_id                    = data.aws_ami.elk.image_id
  iam_instance_profile        = aws_iam_instance_profile.elk.name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.elk.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}
