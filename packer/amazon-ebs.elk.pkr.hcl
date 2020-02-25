
source "amazon-ebs" "elk" {
  source_ami_filter {
    filters {
      virtualization-type= "hvm"
      name= "amzn2-ami-hvm-*-x86_64-ebs"
      root-device-type= "ebs"
    }
    owners= ["amazon"]
    most_recent= true
  }

  instance_type= "t2.micro"
  ssh_username= "ec2-user"
  ami_name= "elk-1-{{timestamp}}"
  ami_description= "elk 1"
  ami_virtualization_type= "hvm"
  temporary_key_pair_name= "amazon-packer-{{timestamp}}"
  region="eu-west-2"
  vpc_id= "vpc-0e2e925de622375b5"
  subnet_id="subnet-05f8f3c120238ca8d"
  #spot_price="auto"
  associate_public_ip_address= true
  run_tags {
    Name= "amazon-elk"
    Application= "ELK"
  }
}
