
output "autoscaling" {
  value = module.elk.autoscaling
}

output "launch_config" {
  value = module.elk.launch_conf
}

output "security_group" {
  value = module.elk.security_group
}

output "security_group_lb" {
  value = module.elk.security_group_lb
}

output "lb" {
  value = module.elk.lb
}
