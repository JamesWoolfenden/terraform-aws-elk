data "aws_ami" "elk" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  owners = [data.aws_caller_identity.current.account_id]
}
