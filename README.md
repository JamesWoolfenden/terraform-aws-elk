
[![Slalom][logo]](https://slalom.com)

# terraform-aws-elk [![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-elk.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-elk) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-elk.svg)](https://github.com/JamesWoolfenden/terraform-aws-elk/releases/latest)

This is a basic example for making an ELK stack server.
Updating to use Amazon linux2 Packer ami, and auto-scaling.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

Build you AMI's first.
In the *Packer* folder :

```cli
$ packer build .\packer\
```

<https://www.elastic.co/guide/en/elastic-stack-get-started/7.6/get-started-elastic-stack.html#install-elasticsearch>

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "s3" {
source      = "JamesWoolfenden/aws/elk"
version     = "0.0.4"
common_tags = var.common_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_name | Partial string to match the target AMI | string | n/a | yes |
| common\_tags | A set of tags | map | n/a | yes |
| ingress\_cidrs | A range that is allowed to access ELK stack | list(string) | n/a | yes |
| instance\_type | The AWS instance size for the ELK server | string | n/a | yes |
| ssh\_cidrs | A range that is allowed to ssh on to the ELK stack | list(string) | n/a | yes |
| subnet\_tag | A string tag to identity the sub-net to use | string | n/a | yes |
| vpc\_cidr | The CIDR range to identity the VPC to use | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-elk/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-elk/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-elk&url=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-elk&url=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-elk
[share_email]: mailto:?subject=terraform-aws-elk&body=https://github.com/JamesWoolfenden/terraform-aws-elk
