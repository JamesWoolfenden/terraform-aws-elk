
output "autoscaling" {
    value=aws_autoscaling_group.elk
}

output "launch_config" {
    value=aws_launch_configuration.elk
}

output "security_group" {
    value=aws_security_group.elk
}
