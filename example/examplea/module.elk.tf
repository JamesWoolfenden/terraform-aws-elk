module "elk" {
  source         = "../../"
  ami_name       = var.ami_name
  ingress_cidrs  = ["0.0.0.0/0"]
  ssh_cidrs      = [module.ip.cidr]
  instance_type  = var.instance_type
  subnet_private = data.aws_subnet_ids.private
  subnet_public  = data.aws_subnet_ids.public
  vpc_id         = data.aws_vpc.vpc.id
}
module "ip" {
  source = "git::https://github.com/JamesWoolfenden/terraform-http-ip.git?ref=5769331633debca683a81a38470083a0abd39049"
}
