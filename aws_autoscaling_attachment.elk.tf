resource "aws_autoscaling_attachment" "elk" {
  # checkov:skip=CKV2_AWS_15: TODO
  autoscaling_group_name = aws_autoscaling_group.elk.id
  elb                    = aws_elb.elk.id
}
