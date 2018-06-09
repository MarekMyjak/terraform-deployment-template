provider "heroku" {
  email   = "marek.myjak1221@gmail.com"
  api_key = "5757b479-54ec-438f-ab2b-f5ad30196193"
}

resource "heroku_app" "myNewHerokuApp" {
  name = "name-of-my-new-heroku-app"
  region = "eu"
  stack = "heroku-16"

  provisioner "local-exec" {
    command = "./git.sh ${heroku_app.myNewHerokuApp.git_url} https://github.com/heroku/node-js-getting-started.git node-js-getting-started"
  }
}

output "url" {
  value = "${heroku_app.myNewHerokuApp.web_url}"
}

output "git_url" {
  value = "${heroku_app.myNewHerokuApp.git_url}"
}

