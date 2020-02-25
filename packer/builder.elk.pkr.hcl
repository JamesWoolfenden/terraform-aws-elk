build {
sources=[
  "source.amazon-ebs.elk"
  ]

  provisioner "shell" {
     scripts = ["packer/install-elk.sh"]
  }
}
