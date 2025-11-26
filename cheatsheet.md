### Terraform
* terrafrom version 1.14.0
* terraform block: terraform
* required_version: terraform, required_version
* required_providers: terraform, required_providers
* aws provider:  terraform, required_providers, source hashicorp/aws, version 6.21.0
* provider: name, region
* backend block: backend, s3 bucket, region, key
* locals: key = value | usage local.key
* merge: block1, block2
* output: description, value | usage module.name.id
* variable: description, type, default | usage type: string, list(string)
* vpc module: source, version | terraform-aws-modules/vpc/aws 5.4.0
* terraform init -migrate-state
* terraform init -reconfigure

### VPC
* name
* cidr
* azs
* public subnet
* private subnet
* nat gateway
* dns hostnames
* dns support
