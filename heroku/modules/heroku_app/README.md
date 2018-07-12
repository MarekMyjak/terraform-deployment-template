# Heroku App Terraform module

Terraform module which creates heroku app

## Usage

```hcl
module "heroku_app" {
  source = "modules/heroku_app"

  application_name = "terraform-node-app"
  project_directory = "/home/marek/IdeaProjects/node-js-getting-started"
}

output "url" {
  value = "${module.heroku_app.url}"
}

output "git_url" {
  value = "${module.heroku_app.git_url}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | heroku region | string | `eu` | no |
| project_directory | Path tp project directory | string | - | yes |
| application_name | Application name | string | - | yes |
| stack | Application stack | string | "heroku-16" | no |


## Outputs

| Name | Description |
|------|-------------|
| url | Url to deployed app |
| git_url | Url to heroku repository |
