resource "aws_autoscaling_attachment" "elk" {
  autoscaling_group_name = aws_autoscaling_group.elk.id
  elb                    = aws_elb.elk.id
}
