
output "autoscaling" {
  value = aws_autoscaling_group.elk
}

output "launch_conf" {
  value = aws_launch_configuration.elk
}

output "security_group" {
  value = aws_security_group.elk
}

output "security_group_lb" {
  value = aws_security_group.lb
}

output "lb" {
  value = aws_elb.elk
}
