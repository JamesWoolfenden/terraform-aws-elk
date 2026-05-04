module "elk" {
  source         = "../../"
  ami_name       = var.ami_name
  ingress_cidrs  = ["0.0.0.0/0"]
  ssh_cidrs      = [module.ip.cidr]
  instance_type  = var.instance_type
  subnet_private = data.aws_subnets.private
  subnet_public  = data.aws_subnets.public
  vpc_id         = data.aws_vpc.vpc.id
}
module "ip" {
  source = "git::https://github.com/JamesWoolfenden/terraform-http-ip.git?ref=2f3cef24e667fb840a3d3481f5a1aaa5a1ac7d28" #v0.3.14
}
