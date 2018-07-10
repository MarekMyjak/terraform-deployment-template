provider "heroku" {
  //Heroku API token. It must be provided, but it can also be sourced from the HEROKU_API_KEY environment variable.
}

resource "heroku_app" "myNewHerokuApp" {
  name = "name-of-my-new-heroku-app"
  region = "eu"
  stack = "heroku-16"

  provisioner "local-exec" {
    command = "./deploy.sh ${heroku_app.myNewHerokuApp.git_url} /home/marek/IdeaProjects/node-js-getting-started"
  }
}

output "url" {
  value = "${heroku_app.myNewHerokuApp.web_url}"
}

output "git_url" {
  value = "${heroku_app.myNewHerokuApp.git_url}"
}

