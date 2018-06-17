# AWS Elastic Beanstalk(bucket + app + env) Terraform module

Terraform module which creates Elastic Beanstalk resources on AWS.

## Usage

```hcl
module "aws_eleastic_beanstalk" {
  source = "modules/aws elastic beanstalk(bucket + app + env)"

  application_name = "app-name"
  application_version_name = "v1"
  object_source = "../apps/get-started-node.zip"
  solution_stack_name = "64bit Amazon Linux 2018.03 v4.5.0 running Node.js"
}

output "environment_name" {
  value = "${module.aws_eleastic_beanstalk.environment_name}"
}

output "url" {
  value = "${module.aws_eleastic_beanstalk.url}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | AWS region | string | `eu-west-1` | no |
| solution_stack_name | solution stack | string | `64bit Amazon Linux 2018.03 v4.5.0 running Node.js` | no |
| object_source | Path to source app. | string | - | yes |
| application_name | Application name | string | - | yes |
| application_version_name | Version | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| url | Url to deployed app |
| environment_name | Name of the environment |