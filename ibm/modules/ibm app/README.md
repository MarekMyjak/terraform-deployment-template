# IBM App Terraform module

Terraform module which creates IBM app

## Usage

```hcl
module "ibm_app" {
  source = "modules/ibm app"

  org = "marekmyjak"
  space = "dev"
  app_domain_shared = "eu-gb.mybluemix.net"
  host = "terraform-host"
  application_name = "my-app"
  object_source = "../apps/get-started-node.zip"
  buildpack = "sdk-for-nodejs"
  application_version_name = "1"
}

output "url" {
  value = "${module.ibm_app.url}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | IBM region | string | `eu-gb` | no |
| org | The name of the IBM Cloud organization. | string | - | yes |
| space | The name of your space. | string | - | yes |
| app_domain_shared | The name of the shared domain. | string | - | yes |
| host | The host portion of the route. Required for shared domains | string | - | yes |
| object_source | The path to the compressed file of the application. The compressed file must contain all the application files directly within it instead of within a top-level folder. | string | - | yes |
| buildpack | The buildpack to compile or prepare the application. You can provide its values in the following ways: | string | - | yes |
| application_name | Application name | string | - | yes |
| application_version_name | Version | string | - | yes |
| memory | The amount of memory, specified in megabytes, that each instance has. | string | `128` | no |
| disk_quota | The maximum amount of disk, specified in megabytes, available to an instance of an application. | string | `128` | no |
| instances | The number of instances of the application. | number | 1 | no |

## Outputs

| Name | Description |
|------|-------------|
| url | Url to deployed app |