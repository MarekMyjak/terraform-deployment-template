module "heroku_app" {
  source = "modules/heroku_app"

  application_name = "terraform-node-app"
  project_directory = "/home/marek/IdeaProjects/node-js-getting-started"
  stack = "heroku-16"
}

output "url" {
  value = "${module.heroku_app.url}"
}

output "git_url" {
  value = "${module.heroku_app.git_url}"
}