variable "region" {
  default = "eu"
}
variable "stack" {
  default = "heroku-16"
}
variable "application_name" {}
variable "project_directory" {}

provider "heroku" {
  //Heroku API token. It must be provided, but it can also be sourced from the HEROKU_API_KEY environment variable.
}

resource "heroku_app" "myNewHerokuApp" {
  name = "${var.application_name}"
  region = "${var.region}"
  stack = "${var.stack}"

  provisioner "local-exec"{
    command = "${path.module}/deploy.sh ${heroku_app.myNewHerokuApp.git_url} ${var.project_directory}"
  }
}

output "url" {
  value = "${heroku_app.myNewHerokuApp.web_url}"
}

output "git_url" {
  value = "${heroku_app.myNewHerokuApp.git_url}"
}

