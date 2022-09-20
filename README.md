# terraform-aws-elk

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-elk/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-elk)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-elk.svg)](https://github.com/JamesWoolfenden/terraform-aws-elk/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-elk.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-elk/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-elk/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-elk&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-elk/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-elk&benchmark=INFRASTRUCTURE+SECURITY)

This is a basic example for making an ELK stack server.
Updated to use Amazon linux2 Packer AMI, and Auto-scaling.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Introduction

Build you AMI's first. The example uses HCL2 which is in beta, you will have to add your own region,vpc_id and subnet_id. Your subnet needs to ssh'able.

In the _Packer_ folder :

```cli
$ packer build .\packer\
....
```

or

```cli
$ packer build ./packer/
....
```

<https://www.elastic.co/guide/en/elastic-stack-get-started/7.6/get-started-elastic-stack.html#install-elasticsearch>

With an AMI built the Terraform module will pick up the latest build version from your account.

## Usage

To use this module add **module.elk.tf** as below into your Terraform code:

```hcl
module "elk" {
  source              = "JamesWoolfenden/elk/aws
  version             = "0.2.15"
  ami_name            = var.ami_name
  ingress_cidrs       = ["0.0.0.0/0"]
  ssh_cidrs           = ["0.0.0.0/0"]
  instance_type       = var.instance_type
  private_subnet_tag  = var.private_subnet_tag
  vpc_cidr            = var.vpc_cidr
}
```

Replace 0.0.0.0/0 CIDRS with your own ranges, for more implmentation details see the full example in /example/examplea.

## Costs

```text
Monthly cost estimate

Project: .

 Name                                                    Monthly Qty  Unit         Monthly Cost

 module.elk.aws_autoscaling_group.elk
 └─ module.elk.aws_launch_configuration.elk
    ├─ Instance usage (Linux/UNIX, on-demand, t2.large)            0  hours               $0.00
    ├─ EC2 detailed monitoring                                     0  metrics             $0.00
    └─ root_block_device
       └─ Storage (general purpose SSD, gp2)                       0  GB-months           $0.00

 module.elk.aws_elb.elk
 ├─ Classic load balancer                                        730  hours              $21.46
 └─ Data processed                                       Cost depends on usage: $0.0084 per GB

 PROJECT TOTAL                                                                           $21.46

```

## Check instance

This instance[and my user] is set-up to use _ec2-instance-connect_.

```cli
aws ec2-instance-connect send-ssh-public-key --region us-west-2 --instance-id i-0aa77051c763cd094 --availability-zone us-west-2b --instance-os-user ec2-user --ssh-public-key file://mynew_key.pub
ssh -i mynew_key ec2-user@10.22.7.233
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_elb.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) | resource |
| [aws_iam_instance_profile.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_configuration.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_security_group.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name) | Partial string to match the target AMI | `string` | n/a | yes |
| <a name="input_asg"></a> [asg](#input\_asg) | Settings to ensure that there's always an instance | `map` | <pre>{<br>  "max_size": 1,<br>  "min_size": 1,<br>  "name": "ELK server"<br>}</pre> | no |
| <a name="input_elb_name"></a> [elb\_name](#input\_elb\_name) | (optional) describe your variable | `string` | `"elk-elb"` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Root block device encryption | `bool` | `true` | no |
| <a name="input_ingress_cidrs"></a> [ingress\_cidrs](#input\_ingress\_cidrs) | A range that is allowed to access ELK stack | `list(string)` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The AWS instance size for the ELK server | `string` | n/a | yes |
| <a name="input_ssh_cidrs"></a> [ssh\_cidrs](#input\_ssh\_cidrs) | A range that is allowed to ssh on to the ELK stack | `list(string)` | n/a | yes |
| <a name="input_subnet_private"></a> [subnet\_private](#input\_subnet\_private) | n/a | `any` | n/a | yes |
| <a name="input_subnet_public"></a> [subnet\_public](#input\_subnet\_public) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling"></a> [autoscaling](#output\_autoscaling) | Details of autoscaling |
| <a name="output_launch_conf"></a> [launch\_conf](#output\_launch\_conf) | Details of Launch Configuration |
| <a name="output_lb"></a> [lb](#output\_lb) | Details of the load balancer |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | Details of the Security Group |
| <a name="output_security_group_lb"></a> [security\_group\_lb](#output\_security\_group\_lb) | Details of the Security Group of the load balancer |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "autoscaling:AttachLoadBalancers",
                "autoscaling:CreateAutoScalingGroup",
                "autoscaling:CreateLaunchConfiguration",
                "autoscaling:DeleteAutoScalingGroup",
                "autoscaling:DeleteLaunchConfiguration",
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeScalingActivities",
                "autoscaling:DetachLoadBalancers",
                "autoscaling:UpdateAutoScalingGroup"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateSecurityGroup",
                "ec2:DeleteSecurityGroup",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeImages",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSecurityGroups",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:AttachLoadBalancerToSubnets",
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:CreateLoadBalancerListeners",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:ModifyLoadBalancerAttributes"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "iam:AddRoleToInstanceProfile",
                "iam:AttachRolePolicy",
                "iam:CreateInstanceProfile",
                "iam:CreateRole",
                "iam:DeleteInstanceProfile",
                "iam:DeleteRole",
                "iam:DetachRolePolicy",
                "iam:GetInstanceProfile",
                "iam:GetRole",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:RemoveRoleFromInstanceProfile"
            ],
            "Resource": "*"
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Help

To check is using systemd or not

```cli
ps -p 1
```

### Configuration

Ensure in _elasticsearch.yml_

```cli
network.host: 0.0.0.0
```

and in _kibana.yml_

```cli
server.host: <servers ip>
```

### todo

- app config in user data
- get data <https://www.elastic.co/blog/getting-aws-logs-from-s3-using-filebeat-and-the-elastic-stack?blade=kibanafeed>
- automate config above

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-elk/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-elk/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
