## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami_name | Partial string to match the target AMI | string | - | yes |
| common_tags | A set of tags | map | - | yes |
| depends_on | This is a way to make a module depends on, which isnt built to depend on | list | `<list>` | no |
| instance_type | The AWS instance size for the ELK server | string | - | yes |
| key_name | The namne of the ssh key | string | - | yes |
| subnet_type | A string tag to identity the subnet to use | string | - | yes |
| vpc_cidr | Tge cidr range to identity the VPC to use | string | - | yes |
