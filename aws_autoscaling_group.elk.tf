resource "aws_autoscaling_group" "elk" {
  name                 = var.asg["name"]
  launch_configuration = aws_launch_configuration.elk.name
  min_size             = var.asg["min_size"]
  max_size             = var.asg["max_size"]
  vpc_zone_identifier  = data.aws_subnet_ids.private.ids

  lifecycle {
    create_before_destroy = true
  }

}

variable "asg" {
  description = "Settings to ensure that there's always an instance"
  default = {
    min_size = 1
    max_size = 1
    name     = "ELK server"
  }
}
