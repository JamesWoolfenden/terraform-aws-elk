[![Slalom][logo]](https://slalom.com)

# terraform-aws-elk

[![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-elk.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-elk)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-elk.svg)](https://github.com/JamesWoolfenden/terraform-aws-elk/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

This is a basic example for making an ELK stack server.
Updated to use Amazon linux2 Packer AMI, and Auto-scaling.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Introduction

Build you AMI's first. The example uses HCL2 which is in beta, you will have to add your own region,vpc_id and subnet_id. Your subnet needs to ssh'able.

In the *Packer* folder :

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

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "elk" {
  source        = "JamesWoolfenden/elk/aws
  version       = "0.2.6"
  ami_name      = var.ami_name
  ingress_cidrs = ["0.0.0.0/0"]
  ssh_cidrs     = ["0.0.0.0/0"]
  instance_type = var.instance_type
  common_tags   = var.common_tags
  private_subnet_tag    = var.private_subnet_tag
  vpc_cidr      = var.vpc_cidr
}
}
```

## Check instance

This instance[and my user] is set-up to use *ec2-instance-connect*.

```cli
aws ec2-instance-connect send-ssh-public-key --region us-west-2 --instance-id i-0aa77051c763cd094 --availability-zone us-west-2b --instance-os-user ec2-user --ssh-public-key file://mynew_key.pub
ssh -i mynew_key ec2-user@10.22.7.233
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Error: no lines in file
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Help

To check is using systemd or not

```cli
ps -p 1
```

### Configuration

Ensure in *elasticsearch.yml*

```cli
network.host: 0.0.0.0
```

and in *kibana.yml*

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

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-elk&url=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-elk&url=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_email]: mailto:?subject=terraform-aws-elk&body=https://github.com/JamesWoolfenden/terraform-aws-elk
