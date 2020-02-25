
output "autoscaling" {
  description = "Details of autoscaling"
  value       = aws_autoscaling_group.elk
}

output "launch_conf" {
  description = "Details of Launch Configuration"
  value       = aws_launch_configuration.elk
}

output "security_group" {
  description = "Details of the Security Group"
  value       = aws_security_group.elk
}

output "security_group_lb" {
  description = "Details of the Security Group of the load balancer"
  value       = aws_security_group.lb
}

output "lb" {
  description = "Details of the load balancer"
  value       = aws_elb.elk
}
